[L1,L2,L3,L4,L5,L6,mu] = linkLengths ();

theta_ML = sym('theta_ML','real');
theta_MR = sym('theta_MR','real');
dtheta_ML = sym('dtheta_ML','real');
dtheta_MR = sym('dtheta_MR','real');
zero_origin_opp = 2.23; % rad

q1 = -(zero_origin_opp-pi/2) - theta_ML; 
q2 = (zero_origin_opp-pi/2) + pi - theta_MR; 

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

Polar_position = [r;phi];
Polar_velocity = jacobian(Polar_position,[theta_ML;theta_MR])*[dtheta_ML;dtheta_MR];
dr = Polar_velocity(1);
dphi = Polar_velocity(2);

Polar = [r;phi;dr;dphi];

% Polar
ForKinF = symfun(Polar,[theta_ML;theta_MR]);
ConvertToPolar = matlabFunction(Polar(1),Polar(2),Polar(3),Polar(4),'File',['ConvertToPolar.m'],...
'Vars',[theta_ML;theta_MR;dtheta_ML;dtheta_MR],...
'Outputs',{'r','phi','dr','dphi'},...
'Optimize',0);

% Jacobian_transpose
J = jacobian(Polar_position,[theta_ML;theta_MR]);
J_function = matlabFunction(J(1,1),J(2,1),J(1,2),J(2,2),'File',['Jacobian_Transpose.m'],...
'Vars',[theta_ML;theta_MR],...
'Outputs',{'JT11','JT12','JT21','JT22'},...
'Optimize',1);

