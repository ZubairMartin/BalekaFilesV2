% Bus object: BodyState
clear elems;
elems(1) = Simulink.BusElement;
elems(1).Name = 'x';
elems(1).DataType = 'double';

elems(2) = Simulink.BusElement;
elems(2).Name = 'dx';
elems(2).DataType = 'double';

elems(3) = Simulink.BusElement;
elems(3).Name = 'ddx';
elems(3).DataType = 'double';

elems(4) = Simulink.BusElement;
elems(4).Name = 'y';
elems(4).DataType = 'double';

elems(5) = Simulink.BusElement;
elems(5).Name = 'dy';
elems(5).DataType = 'double';

elems(6) = Simulink.BusElement;
elems(6).Name = 'ddy';
elems(6).DataType = 'double';

elems(7) = Simulink.BusElement;
elems(7).Name = 'r';
elems(7).DataType = 'double';

elems(8) = Simulink.BusElement;
elems(8).Name = 'dr';
elems(8).DataType = 'double';

BodyState = Simulink.Bus;
BodyState.Elements = elems;
clear elems

% Bus object: MotorCmd
clear elems;
elems(1) = Simulink.BusElement;
elems(1).Name = 'q';
elems(1).DataType = 'double';

elems(2) = Simulink.BusElement;
elems(2).Name = 'w';
elems(2).DataType = 'double';

elems(3) = Simulink.BusElement;
elems(3).Name = 'Kp';
elems(3).DataType = 'double';

elems(4) = Simulink.BusElement;
elems(4).Name = 'Kd';
elems(4).DataType = 'double';

elems(5) = Simulink.BusElement;
elems(5).Name = 'tff';
elems(5).DataType = 'double';

MotorCmd = Simulink.Bus;
MotorCmd.Elements = elems;
clear elems

% Bus object: MotorState
clear elems;
elems(1) = Simulink.BusElement;
elems(1).Name = 'q';
elems(1).DataType = 'double';

elems(2) = Simulink.BusElement;
elems(2).Name = 'w';
elems(2).DataType = 'double';

elems(3) = Simulink.BusElement;
elems(3).Name = 't';
elems(3).DataType = 'double';

MotorState = Simulink.Bus;
MotorState.Elements = elems;
clear elems

% Bus object: JacobianValues
clear elems;
elems(1) = Simulink.BusElement;
elems(1).Name = 'JT11';
elems(1).DataType = 'double';

elems(2) = Simulink.BusElement;
elems(2).Name = 'JT12';
elems(2).DataType = 'double';

elems(3) = Simulink.BusElement;
elems(3).Name = 'JT21';
elems(3).DataType = 'double';

elems(4) = Simulink.BusElement;
elems(4).Name = 'JT22';
elems(4).DataType = 'double';

JacobianValues = Simulink.Bus;
JacobianValues.Elements = elems;
clear elems

% Bus object: PolarState
clear elems;
elems(1) = Simulink.BusElement;
elems(1).Name = 'r';
elems(1).DataType = 'double';

elems(2) = Simulink.BusElement;
elems(2).Name = 'phi';
elems(2).DataType = 'double';

elems(3) = Simulink.BusElement;
elems(3).Name = 'dr';
elems(3).DataType = 'double';

elems(4) = Simulink.BusElement;
elems(4).Name = 'dphi';
elems(4).DataType = 'double';

PolarState = Simulink.Bus;
PolarState.Elements = elems;
clear elems

% Bus object: InitConstants
clear elems;
elems(1) = Simulink.BusElement;
elems(1).Name = 'startButton';
elems(1).DataType = 'double';

elems(2) = Simulink.BusElement;
elems(2).Name = 'match_leg_gains';
elems(2).DataType = 'double';

elems(3) = Simulink.BusElement;
elems(3).Name = 'alternate_legs';
elems(3).DataType = 'double';

elems(4) = Simulink.BusElement;
elems(4).Name = 'control_type';
elems(4).DataType = 'double';

elems(5) = Simulink.BusElement;
elems(5).Name = 'dx_des';
elems(5).DataType = 'double';

elems(6) = Simulink.BusElement;
elems(6).Name = 'r_IC';
elems(6).DataType = 'double';

elems(7) = Simulink.BusElement;
elems(7).Name = 'phi_IC';
elems(7).DataType = 'double';

elems(8) = Simulink.BusElement;
elems(8).Name = 'dr_IC';
elems(8).DataType = 'double';

elems(9) = Simulink.BusElement;
elems(9).Name = 'dphi_IC';
elems(9).DataType = 'double';

elems(10) = Simulink.BusElement;
elems(10).Name = 'Kp_r_IC';
elems(10).DataType = 'double';

elems(11) = Simulink.BusElement;
elems(11).Name = 'Kd_r_IC';
elems(11).DataType = 'double';

elems(12) = Simulink.BusElement;
elems(12).Name = 'Kp_phi_IC';
elems(12).DataType = 'double';

elems(13) = Simulink.BusElement;
elems(13).Name = 'Kd_phi_IC';
elems(13).DataType = 'double';

elems(14) = Simulink.BusElement;
elems(14).Name = 'r_RC_23';
elems(14).DataType = 'double';

elems(15) = Simulink.BusElement;
elems(15).Name = 'phi_RC_23';
elems(15).DataType = 'double';

elems(16) = Simulink.BusElement;
elems(16).Name = 'dr_RC_23';
elems(16).DataType = 'double';

elems(17) = Simulink.BusElement;
elems(17).Name = 'dphi_RC_23';
elems(17).DataType = 'double';

elems(18) = Simulink.BusElement;
elems(18).Name = 'Fthrust_RC_23';
elems(18).DataType = 'double';

elems(19) = Simulink.BusElement;
elems(19).Name = 'Kp_r_RC_23';
elems(19).DataType = 'double';

elems(20) = Simulink.BusElement;
elems(20).Name = 'Kd_r_RC_23';
elems(20).DataType = 'double';

elems(21) = Simulink.BusElement;
elems(21).Name = 'Kp_phi_RC_23';
elems(21).DataType = 'double';

elems(22) = Simulink.BusElement;
elems(22).Name = 'Kd_phi_RC_23';
elems(22).DataType = 'double';

elems(23) = Simulink.BusElement;
elems(23).Name = 'r_thrust_RC_23';
elems(23).DataType = 'double';

elems(24) = Simulink.BusElement;
elems(24).Name = 'GAIN_dx_RC_23';
elems(24).DataType = 'double';

elems(25) = Simulink.BusElement;
elems(25).Name = 'r_RC_14';
elems(25).DataType = 'double';

elems(26) = Simulink.BusElement;
elems(26).Name = 'phi_RC_14';
elems(26).DataType = 'double';

elems(27) = Simulink.BusElement;
elems(27).Name = 'dr_RC_14';
elems(27).DataType = 'double';

elems(28) = Simulink.BusElement;
elems(28).Name = 'dphi_RC_14';
elems(28).DataType = 'double';

elems(29) = Simulink.BusElement;
elems(29).Name = 'Fthrust_RC_14';
elems(29).DataType = 'double';

elems(30) = Simulink.BusElement;
elems(30).Name = 'Kp_r_RC_14';
elems(30).DataType = 'double';

elems(31) = Simulink.BusElement;
elems(31).Name = 'Kd_r_RC_14';
elems(31).DataType = 'double';

elems(32) = Simulink.BusElement;
elems(32).Name = 'Kp_phi_RC_14';
elems(32).DataType = 'double';

elems(33) = Simulink.BusElement;
elems(33).Name = 'Kd_phi_RC_14';
elems(33).DataType = 'double';

elems(34) = Simulink.BusElement;
elems(34).Name = 'r_thrust_RC_14';
elems(34).DataType = 'double';

elems(35) = Simulink.BusElement;
elems(35).Name = 'GAIN_dx_RC_14';
elems(35).DataType = 'double';

elems(36) = Simulink.BusElement;
elems(36).Name = 'x_des';
elems(36).DataType = 'double';

elems(37) = Simulink.BusElement;
elems(37).Name = 'tau_limit';
elems(37).DataType = 'double';

elems(38) = Simulink.BusElement;
elems(38).Name = 'knee_limit';
elems(38).DataType = 'double';

elems(39) = Simulink.BusElement;
elems(39).Name = 'offset_phi_limit';
elems(39).DataType = 'double';

elems(40) = Simulink.BusElement;
elems(40).Name = 'm_eff';
elems(40).DataType = 'double';

elems(41) = Simulink.BusElement;
elems(41).Name = 'dr_contact';
elems(41).DataType = 'double';

elems(42) = Simulink.BusElement;
elems(42).Name = 'update_controller_Kd_r';
elems(42).DataType = 'double';

InitConstants = Simulink.Bus;
InitConstants.Elements = elems;
clear elems


% Bus object: ControllerReadings_M23
clear elems;
elems(1) = Simulink.BusElement;
elems(1).Name = 'r';
elems(1).DataType = 'double';

elems(2) = Simulink.BusElement;
elems(2).Name = 'phi';
elems(2).DataType = 'double';

elems(3) = Simulink.BusElement;
elems(3).Name = 'dr';
elems(3).DataType = 'double';

elems(4) = Simulink.BusElement;
elems(4).Name = 'dphi';
elems(4).DataType = 'double';

elems(5) = Simulink.BusElement;
elems(5).Name = 'Fr';
elems(5).DataType = 'double';

elems(6) = Simulink.BusElement;
elems(6).Name = 'Tau_r';
elems(6).DataType = 'double';

elems(7) = Simulink.BusElement;
elems(7).Name = 'stance_time';
elems(7).DataType = 'double';

elems(8) = Simulink.BusElement;
elems(8).Name = 'left_knee';
elems(8).DataType = 'double';

elems(9) = Simulink.BusElement;
elems(9).Name = 'right_knee';
elems(9).DataType = 'double';

elems(10) = Simulink.BusElement;
elems(10).Name = 'contact_offset';
elems(10).DataType = 'double';

ControllerReadings_M23 = Simulink.Bus;
ControllerReadings_M23.Elements = elems;
clear elems

% Bus object: statusCAN
clear elems;
elems(1) = Simulink.BusElement;
elems(1).Name = 'Avg_bus_load';
elems(1).DataType = 'double';

elems(2) = Simulink.BusElement;
elems(2).Name = 'Receiving';
elems(2).DataType = 'double';

elems(3) = Simulink.BusElement;
elems(3).Name = 'Rx_queue_empty';
elems(3).DataType = 'double';

elems(4) = Simulink.BusElement;
elems(4).Name = 'Rx_overrun_count';
elems(4).DataType = 'double';

elems(5) = Simulink.BusElement;
elems(5).Name = 'Rx_buffer_level';
elems(5).DataType = 'double';

elems(6) = Simulink.BusElement;
elems(6).Name = 'Tx_pending';
elems(6).DataType = 'double';

elems(7) = Simulink.BusElement;
elems(7).Name = 'Tx_overrun_count';
elems(7).DataType = 'double';

elems(8) = Simulink.BusElement;
elems(8).Name = 'Tx_Buffer_Level';
elems(8).DataType = 'double';

elems(9) = Simulink.BusElement;
elems(9).Name = 'Warning';
elems(9).DataType = 'double';

elems(10) = Simulink.BusElement;
elems(10).Name = 'Err_Passive';
elems(10).DataType = 'double';

elems(11) = Simulink.BusElement;
elems(11).Name = 'Bus_Off_Status';
elems(11).DataType = 'double';

elems(12) = Simulink.BusElement;
elems(12).Name = 'Bus_Reco_Cnt';
elems(12).DataType = 'double';

elems(13) = Simulink.BusElement;
elems(13).Name = 'BRP';
elems(13).DataType = 'double';

elems(14) = Simulink.BusElement;
elems(14).Name = 'TSEG1';
elems(14).DataType = 'double';

elems(15) = Simulink.BusElement;
elems(15).Name = 'TSEG2';
elems(15).DataType = 'double';

elems(16) = Simulink.BusElement;
elems(16).Name = 'SJW';
elems(16).DataType = 'double';

statusCAN = Simulink.Bus;
statusCAN.Elements = elems;
clear elems