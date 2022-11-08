
p_des = 0.0;
v_des = 2.0;
kp = 0.0;
kd = 2.0;
t_ff = 0.0;

p_min = -12.5; % rad
p_max = +12.5; % rad
v_min = -50.0; % rad/s
v_max = +50.0; % rad/s
t_min = -65.0; % Nm
t_max = +65.0; % Nm
kp_min = 0;
kp_max = 500;
kd_min = 0;
kd_max = 5;

% bound inputs
p_des = min([max([p_min,p_des]),p_max]);
v_des = min([max([v_min,v_des]),v_max]);
kp = min([max([kp_min,kp]),kp_max]);
kd = min([max([kd_min,kd]),kd_max]);
t_ff = min([max([t_min,t_ff]),t_max]);

% convert floats to unsigned integers
p_int = float_to_uint(p_des, p_min, p_max, 16);
v_int = float_to_uint(v_des, v_min, v_max, 12);
kp_int = float_to_uint(kp, kp_min, kp_max, 12);
kd_int = float_to_uint(kd, kd_min, kd_max, 12);
t_int = float_to_uint(t_ff, t_min, t_max, 12);

% % break up for CAN frame 
% P8H = bitshift(p_int, -8); % 8 higher bits
% P8L = bitand(p_int, 0xFF); % 8 lower bits
% V8H = bitshift(v_int, -4); % 8 higher bits
% V4L = bitand(v_int, 0xF); % 4 lower bits
% KP4H = bitshift(kp_int, -8); % 4 higher bits
% KP8L = bitand(kp_int, 0xFF); % 8 lower bits
% KD8H = bitshift(kd_int, -4); % 8 higher bits
% KD4L = bitand(kd_int, 0xF); % 4 lower bits
% T4H = bitshift(t_int, -8); % 4 higher bits
% T8L = bitand(t_int, 0xFF); % 8 lower bits
    
% Converts a float to an unsigned int, given range and number of bits
function x_int = float_to_uint(x, x_min, x_max, n_bits)
    span = x_max - x_min;
    min([max([x_min,x]),x_max]);
    x_int = ((x - x_min)*(bitshift(1, n_bits) / span));
end

function x_int = float_to_uint2(x, x_min, x_max, n_bits)
    span = x_max - x_min;
    if(x < x_min) 
        x_int = x_min;
    elseif(x > x_max) 
        x_int = x_max;
    else
        x_int = ((x - x_min)*(bitshift(1,n_bits)/span));
    end
end

%final_values = desired_pos,desired_vel,desired_kp,desired_kd,desired_tau;
