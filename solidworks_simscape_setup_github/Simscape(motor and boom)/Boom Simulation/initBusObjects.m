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

% Bus object: PistonCmd
clear elems;
elems(1) = Simulink.BusElement;
elems(1).Name = 'ue';
elems(1).DataType = 'double';

elems(2) = Simulink.BusElement;
elems(2).Name = 'ur';
elems(2).DataType = 'double';

PistonCmd = Simulink.Bus;
PistonCmd.Elements = elems;
clear elems

% Bus object: PistonState
clear elems;
elems(1) = Simulink.BusElement;
elems(1).Name = 'p';
elems(1).DataType = 'double';

elems(2) = Simulink.BusElement;
elems(2).Name = 'v';
elems(2).DataType = 'double';

PistonState = Simulink.Bus;
PistonState.Elements = elems;
clear elems
