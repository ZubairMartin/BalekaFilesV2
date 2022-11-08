
L1 = 17.5/100;
L2 = 17.5/100;
L3 = 30/100;
L4 = 30/100;
L5 = 12/100;
L6 = 4/100;
mu = 150*pi/180;

theta1 = sym('theta1','real');
theta2 = sym('theta2','real');
dtheta1 = sym('dtheta1','real');
dtheta2 = sym('dtheta2','real');

q1 =  pi/2 - theta1; 
q2 =  pi/2 - theta2;

%% Find knee coordinates and distances
B1 = [-0.5*L5 - L1*cos(q1) ; L1*sin(q1)];
B2 = [0.5*L5 + L2*cos(pi-q2) ; L2*sin(pi-q2)];

a = abs(B1(1) - B2(1));
b =  B1(2) - B2(2);
B12 = sqrt(a^2 + b^2);

%% Knee angle
alpha = atan2(b,a);
beta = acos( ((L4)^2 - (B12)^2 - (L3)^2)/(-2*(B12)*(L3)) );
q3 = alpha + beta;

%% Angle between virtual leg and knee
c = sqrt(L3^2 + L6^4 - 2*L3*L6*cos(mu)); % virtual leg
lamda = asin(L6*(sin(mu)/c));

X_foot = 0.5*L5 + L2*cos(pi-q2) - c*cos(q3+lamda);
Y_foot = L2*sin(pi-q2) + c*sin(q3+lamda);

r = sqrt((X_foot)^2 + (Y_foot)^2);
phi = (pi/2 - atan(Y_foot,X_foot));
Polar = [r;phi];

dPolar = jacobian(Polar,[theta1;theta2])*[dtheta1;dtheta2];

dr = dPolar(1);
dphi = dPolar(2);

% Polar
ForKinF = symfun(Polar,[theta1;theta2]);
Polar_function = matlabFunction(Polar(1),Polar(2),'File',['Position.m'],...
'Vars',[theta1;theta2],...
'Outputs',{'r','phi'},...
'Optimize',0);
 
%dPolar
ForKindF = symfun(dPolar,[theta1;theta2;dtheta1;dtheta2]);
dPolar_function = matlabFunction(dPolar(1),dPolar(2),'File',['Velocity.m'],...
'Vars',[theta1;theta2;dtheta1;dtheta2],...
'Outputs',{'dr','dphi'},...
'Optimize',0);

% Jacobian_transpose
J = jacobian(Polar,[theta1;theta2]);
J_function = matlabFunction(J(1,1),J(2,1),J(1,2),J(2,2),'File',['Jacobian_Transpose.m'],...
'Vars',[theta1;theta2],...
'Outputs',{'JT11','JT12','JT21','JT22'},...
'Optimize',1);

% Test
% polar = [4*theta1+2*theta2;5*theta1];
% J = jacobian(polar,[theta1;theta2])

