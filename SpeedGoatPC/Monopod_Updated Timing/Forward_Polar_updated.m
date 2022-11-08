[L1,L2,L3,L4,L5,L6,mu] = linkLengths ();

theta_ML = sym('theta_ML','real');
theta_MR = sym('theta_MR','real');
dtheta_ML = sym('dtheta_ML','real');
dtheta_MR = sym('dtheta_MR','real');
[X_foot,Y_foot,B1,B2,left_knee,right_knee] = FC(theta_ML,theta_MR);

r = sqrt((X_foot)^2 + (Y_foot)^2);
phi = atan2(X_foot,Y_foot);

Polar_position = [r;phi];
Polar_velocity = jacobian(Polar_position,[theta_ML;theta_MR])*[dtheta_ML;dtheta_MR];
dr = Polar_velocity(1);
dphi = Polar_velocity(2);

Polar = [r;phi;dr;dphi;left_knee;right_knee];

% Polar
ForKinF = symfun(Polar,[theta_ML;theta_MR]);
ConvertToPolar = matlabFunction(Polar(1),Polar(2),Polar(3),Polar(4),left_knee,right_knee,'File',['ConvertToPolar.m'],...
'Vars',[theta_ML;theta_MR;dtheta_ML;dtheta_MR],...
'Outputs',{'r','phi','dr','dphi','left_knee','right_knee'},...
'Optimize',0);

% Jacobian_transpose
J = jacobian(Polar_position,[theta_ML;theta_MR]);
J_function = matlabFunction(J(1,1),J(2,1),J(1,2),J(2,2),'File',['Jacobian_Transpose.m'],...
'Vars',[theta_ML;theta_MR],...
'Outputs',{'JT11','JT12','JT21','JT22'},...
'Optimize',1);
