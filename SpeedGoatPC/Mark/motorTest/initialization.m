%% Setup 

% Adjust for testing
th_boom = 10.7; % deg
gravity_activated = 0; % 1 = on, 0 = off

% Initialization
match_leg_gains = -1; % (-1) M14 mirrors M23 (1) M14 is the opposite of M23
zero_origin = -pi/2; % [rad] from downward vertical axis
communication_rate = 500

% Gains
r_IC = 0;
phi_IC = 0;
dr_IC = 0;
dphi_IC = 0;
Kp_r_IC = 0;
Kd_r_IC = 0;
Kp_phi_IC = 0;
Kd_phi_IC = 0;


% % body rotation (radians)
% Hip.M1.w0 = -1.35; %initial velocities
% Hip.M2.w0 = -13.24;
% Hip.M3.w0 = 4.59;
% Hip.M4.w0 = -2.24;
% 
% % % V12 CW is positive (angles in rad)
% motor_angle_M1 = -0.86; %initial angles
% motor_angle_M4 = 0.86;
% motor_angle_M2 = 0.86;
% motor_angle_M3 = -0.86;

% body rotation (radians)
Hip.M1.w0 = 0; %initial velocities
Hip.M2.w0 = 0;
Hip.M3.w0 = 0;
Hip.M4.w0 = 0;

% % V12 CW is positive (angles in rad)
motor_angle_M1 = 0; %initial angles
motor_angle_M4 = 0;
motor_angle_M2 = 0;
motor_angle_M3 = 0;

Hip.M1.q0 = -motor_angle_M1; % right - front
Hip.M4.q0 = -motor_angle_M4; % left - front
Hip.M2.q0 = -motor_angle_M2; % right - front
Hip.M3.q0 = -motor_angle_M3; % left - front
