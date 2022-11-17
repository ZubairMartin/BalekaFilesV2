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

% Bus object: Gains
clear elems;
elems(1) = Simulink.BusElement;
elems(1).Name = 'startButton';
elems(1).DataType = 'double';

elems(2) = Simulink.BusElement;
elems(2).Name = 'r_IC';
elems(2).DataType = 'double';

elems(3) = Simulink.BusElement;
elems(3).Name = 'phi_IC';
elems(3).DataType = 'double';

elems(4) = Simulink.BusElement;
elems(4).Name = 'dr_IC';
elems(4).DataType = 'double';

elems(5) = Simulink.BusElement;
elems(5).Name = 'dphi_IC';
elems(5).DataType = 'double';

elems(6) = Simulink.BusElement;
elems(6).Name = 'Kp_r_IC';
elems(6).DataType = 'double';

elems(7) = Simulink.BusElement;
elems(7).Name = 'Kd_r_IC';
elems(7).DataType = 'double';

elems(8) = Simulink.BusElement;
elems(8).Name = 'Kp_phi_IC';
elems(8).DataType = 'double';

elems(9) = Simulink.BusElement;
elems(9).Name = 'Kd_phi_IC';
elems(9).DataType = 'double';

elems(10) = Simulink.BusElement;
elems(10).Name = 'Kp';
elems(10).DataType = 'double';

elems(11) = Simulink.BusElement;
elems(11).Name = 'Kd';
elems(11).DataType = 'double';

Gains = Simulink.Bus;
Gains.Elements = elems;
clear elems
