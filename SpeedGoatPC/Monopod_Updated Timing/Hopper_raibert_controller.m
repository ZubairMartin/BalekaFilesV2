function [foot_height,ctrl_state,r,phi,tau1,tau2] = raibert_controller(x_des,x_body,y_body,dx_body,pos1,vel1,pos2,vel2) %#codegen
% calculate kinematics
[theta1,omega1,theta2,omega2] = motor2hip(pos1,vel1,pos2,vel2);
[r,phi] = fwd_polar(theta1,theta2);
[~,y_foot] = fwd_cartesian(theta1,theta2);
A = J_polar(theta1,theta2) * [omega1; omega2];
dr = A(1);
dphi = A(2);

% constants
phi_neutral = -pi/2;
r0 = 0.33; % 0.38 0.33
r_min = 0.25; % 0.30 0.25
dt = 0.002;

persistent state
persistent phi0
persistent contact_offset
persistent foot_contact
persistent Ts
persistent stance_timer

if isempty(state)
    state = State.Loading; %Loading
end
if isempty(phi0)
    phi0 = phi_neutral;
end
if isempty(contact_offset)
    contact_offset = 0;
end
if isempty(Ts)
    Ts = 0.23;
end
if isempty(stance_timer)
    stance_timer = 0;
end

% calculate foot contact
foot_height = y_body + y_foot - contact_offset;
if (foot_height > 0.005)
    foot_contact = false;
else
    foot_contact = true;
end

% update stance duration
if foot_contact
    stance_timer = stance_timer + dt;
end

% state transitions
switch(state)
    case State.Loading
        if (dr < 0)
            state = State.Compression;
        end
    case State.Compression
        % leg velocity isn't always exactly zero
        if ((-0.1 < dr && dr < 0.1) && (r < r_min))
            state = State.Thrust;
            contact_offset = y_body + y_foot; % update foot contact offset
        end
    case State.Thrust
        if (r > r0)
            state = State.Unloading;
        end
    case State.Unloading
        if not(foot_contact)
            state = State.Flight;
            Ts = min(stance_timer, 0.28); % record stance time
            stance_timer = 0; % reset stance timer
        end
    case State.Flight
        if foot_contact
            state = State.Loading;
        end
end

% radial thrust control
switch(state)
    case State.Thrust
        F_thrust = 50;
    otherwise
        F_thrust = 0;
end
% tau phi control
switch(state)
    case State.Flight
        % adjust foot placement based on horizontal velocity
        dx_des = -min(max(1.0*(x_body - x_des), -0.5), 0.5);
        x_foot = 0.5*dx_body*0.18 + 0.02*(dx_body - dx_des);
        phi0 = phi_neutral + asin(x_foot / r0);
        tau = 10*(phi0 - phi) + 1*(0 - dphi); % position foot
    otherwise
        tau = 0;
end


% permanent radial spring damper
Fr = 300*(r0 - r) + 15*(0 - dr) + F_thrust;

% transform into joint torques
B = transpose(J_polar(theta1,theta2)) * [Fr; tau];
tau1 = -B(1);
tau2 = -B(2);

ctrl_state = state;
end
