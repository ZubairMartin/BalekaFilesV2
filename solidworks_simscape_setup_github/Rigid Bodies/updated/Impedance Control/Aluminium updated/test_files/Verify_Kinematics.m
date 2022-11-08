clc; clear all;
% Set angles for desired r and phi
disp('--------')

syms theta1 theta2 dtheta1 dtheta2

th1 = 30*pi/180;
th2 = -29*pi/180;
dth1 = 0.0;
dth2 = 0.0;

L1 = 17.5/100;
L2 = 17.5/100;
L3 = 30/100;
L4 = 30/100;
L5 = 12/100;
L6 = 4/100;
mu = 150*pi/180;

% --------------------------------------------------------- %

q1 =  pi/2 - theta1; 
q2 =  pi/2 - theta2;

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


% convert to polar 
r = sqrt((X_foot)^2 + (Y_foot)^2);
phi = (pi/2 - atan2(Y_foot,X_foot));

Polar = [r;phi];
dPolar = jacobian(Polar,[theta1;theta2])*[dtheta1;dtheta2];
J_transpose = jacobian(Polar,[theta1;theta2]);

P = double(simplify(subs(Polar, [theta1 theta2], [th1 th2])))
% dP = double(simplify(subs(dPolar, [theta1 theta2 dtheta1 dtheta2], [th1 th2 dth1 dth2])))
% Jacobian = double(simplify(subs(J_transpose, [theta1 theta2], [th1 th2])))
