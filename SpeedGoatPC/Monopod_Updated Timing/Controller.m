function [B,polarPosition,polarVelocity,Forces,stance_time,knee_angles,contact_values,endSim]  = Controller(clock,motors,InitConstants,bodyState,theta_ML,theta_MR,dtheta_ML,dtheta_MR)
    
    x_body = bodyState.x;
    dx_body = bodyState.dx;
    y_body = bodyState.y;
    dy_body = bodyState.dy;

    startButton = InitConstants.startButton;
    alternate_legs = InitConstants.alternate_legs;
    control_type = InitConstants.control_type;
    dx_des = InitConstants.dx_des;
    x_des = InitConstants.x_des;
    
    r_IC = InitConstants.r_IC;
    phi_IC = InitConstants.phi_IC;
    dr_IC = InitConstants.dr_IC;
    dphi_IC = InitConstants.dphi_IC;
    Kp_r_IC = InitConstants.Kp_r_IC;
    Kd_r_IC = InitConstants.Kd_r_IC;
    Kp_phi_IC = InitConstants.Kp_phi_IC;
    Kd_phi_IC = InitConstants.Kd_phi_IC;

    F_thrust = 0;
    Ts_new = 0;
    foot_height = 0;
    Fr = 0;
    Tau_r = 0;
    endSim = 0;

    if motors == 23
    
        r_ref = InitConstants.r_RC_23;
        phi_ref = InitConstants.phi_RC_23;
        dr_ref = InitConstants.dr_RC_23;
        dphi_ref = InitConstants.dphi_RC_23;
        F_push = InitConstants.Fthrust_RC_23;
    
        Kp_r = InitConstants.Kp_r_RC_23;  
        Kd_r = InitConstants.Kd_r_RC_23;
        Kp_phi = InitConstants.Kp_phi_RC_23;
        Kd_phi  = InitConstants.Kd_phi_RC_23; 
        r_thrust = InitConstants.r_thrust_RC_23;
        GAIN_dx = InitConstants.GAIN_dx_RC_23;

    else % 14
        r_ref = InitConstants.r_RC_14;
        phi_ref = InitConstants.phi_RC_14;
        dr_ref = InitConstants.dr_RC_14;
        dphi_ref = InitConstants.dphi_RC_14;
        F_push = InitConstants.Fthrust_RC_14;
    
        Kp_r = InitConstants.Kp_r_RC_14;  
        Kd_r = InitConstants.Kd_r_RC_14;
        Kp_phi = InitConstants.Kp_phi_RC_14;
        Kd_phi  = InitConstants.Kd_phi_RC_14; 
        r_thrust = InitConstants.r_thrust_RC_14;
        GAIN_dx = InitConstants.GAIN_dx_RC_14;
    end

    [JT11,JT12,JT21,JT22] = Jacobian_Transpose(theta_ML,theta_MR);
    [r,phi,dr,dphi,left_knee,right_knee] = ConvertToPolar(theta_ML,theta_MR,dtheta_ML,dtheta_MR);
    polarPosition = [r;phi];
    polarVelocity = [dr;dphi];
    JT = [JT11,JT12;JT21,JT22];
    
    %wd = (sqrt(4*InitConstants.m_eff*Kp_r-Kd_r^2))/(2*InitConstants.m_eff);
    Ts_expected = pi*sqrt(InitConstants.m_eff/Kp_r); %0.175; %pi/wd;

    y_foot = r*cos(phi); % +ve value
    
    % constants
    phi_neutral = phi_ref;
    r0 = r_ref; % 0.38 0.33
    r_min = r_thrust; % 0.30 0.25
    dt = 0.02;
    
    persistent state
    persistent phi0
    persistent contact_offset
    persistent Ts
    persistent stanceTime

    if startButton == 0
        % 0 = Rest
        state = State.Thrust;
        contact_offset = 0;
        stanceTime = clock;
        w = [0;0];
        B = JT*w;

    elseif startButton == 1
        % 1 = Impedence control
        state = State.Thrust;
        contact_offset = 0;
        stanceTime = clock;
        E = [r_IC - r; phi_IC - phi];
        dE = [dr_IC - dr; dphi_IC - dphi];
        wr = Kp_r_IC*E(1) + Kd_r_IC*dE(1);
        wphi = Kp_phi_IC*E(2) + Kd_phi_IC*dE(2);
        w = [wr;wphi];
        B = JT*w;

    elseif startButton == 2
        % 2 = Hop
        state = State.Thrust;
        contact_offset = 0;
        stanceTime = clock;
        if (r > r0)
            F_thrust = 0;
        else
            F_thrust = F_push;
        end       
        Fr = Kp_r*(r_ref - r) + Kd_r*(dr_ref - dr) + F_thrust;
        B = JT * [Fr; Tau_r];

    else

        % 3 = Raibert Control
        if isempty(state)
            state = State.Thrust;
        end
        if isempty(phi0)
            phi0 = phi_neutral;
        end
        if isempty(contact_offset)
            contact_offset = 0;
        end
        if isempty(Ts)
            Ts = Ts_expected;
        end
        if isempty(stanceTime)
            stanceTime = 0;
        end 

        Tau_r = 7*(dphi_ref - dphi);

        % calculate foot contact
        foot_height = y_body - y_foot; %- contact_offset; % This gets the foot height distance %- contact_offset;
        if dr>InitConstants.dr_contact && (foot_height > 0.01) % rubber mat
            foot_contact = false;
        else
            foot_contact = true;
        end
        
       % (1 = Flight, 2 = Loading, 3 = Compression, 4 = Thrust, 5 = Unloading)
        % state transitions
        if state == State.Flight
            if control_type == 0
                dx_des = 0.0;
            elseif control_type == 1
                dx_des = InitConstants.dx_des;
            elseif control_type == 2
                dx_des = -min(max(1.0*(x_body - x_des), - InitConstants.dx_des),  InitConstants.dx_des);
            elseif control_type == 3
                dx_des = -InitConstants.dx_des;
            end
            
            x_foot = 0.5*dx_body*Ts + GAIN_dx*(dx_body - dx_des);
            phi0 = phi_neutral + asin(x_foot / r);
            Tau_r = Kp_phi*(phi0 - phi) + Kd_phi*(dphi_ref - dphi); % position foot
            if foot_contact
                state = State.Loading;
            end
        
        elseif state == State.Loading
            stanceTime = clock;
            if (dr < 0)
                state = State.Compression;
            end
        
        elseif state == State.Compression
            % leg velocity isn't always exactly zero
            if ((-0.1 < dr && dr < 0.1) && (r < r_min))
                state = State.Thrust;
                contact_offset = y_body - y_foot; % update foot contact offset
            end
       
        elseif state == State.Thrust
            F_thrust = F_push;
            if (r > r0)
                state = State.Unloading;
            end
        
        elseif state == State.Unloading
            if not(foot_contact)
                state = State.Flight;
                stanceTime = clock - stanceTime;
                Ts_new = stanceTime;
                Ts = min(Ts_new,Ts_expected);
                stanceTime = 0;
            end
        end
        
        if state ~= State.Flight
            if InitConstants.update_controller_Kd_r>0
                Kd_r = InitConstants.update_controller_Kd_r;
            end
        end

        % permanent radial spring damper
        Fr = Kp_r*(r_ref - r) + Kd_r*(dr_ref - dr) + F_thrust;
        
        % transform into joint torques
        B = JT * [Fr; Tau_r]; 

        %% Conditions to set tau to zero    
        if abs(phi) >= InitConstants.offset_phi_limit*pi/180 || abs(B(1)) >= InitConstants.tau_limit || abs(B(2)) >= InitConstants.tau_limit || left_knee>=InitConstants.knee_limit || right_knee>=InitConstants.knee_limit || y_body>0.6
            % phi angle is way off for origin
            % Max torque reached
            % knee angle limit
            endSim = 1;
        end   
        
    end
    stance_time = Ts_new;
    Forces = [Fr;Tau_r];
    knee_angles = [left_knee*180/pi;right_knee*180/pi];
    contact_values = [F_thrust;foot_height];
end