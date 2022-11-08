p = 1000
t = linspace(0,9.5,p);

%% solve for velocity from a 30cm drop
vf = sqrt(2*9.81*30/100) % vf^2 = vi^2 + 2gh

%% Compression
v0 = -vf;
g = 9.81;
m = 3.8 + 2.5;

% k = 900;
% c = 130;

% k = 700;
% c = 120;

k = 500;
c = 150;

wd = (1/(2*m))*sqrt(4*k*m - c^2);

A = (c*g - 2*k*v0)/(2*k*wd);
B = (m*g)/k;
C = c/(2*m);
D = (m*g)/k;

x_values = zeros(p);

for i = 1:length(t)
    
    x = (A*sin(wd*t(i)) + B*cos(wd*t(i)))*exp(-C*t(i)) - D;
    x_values(i) = x;
    
end

plot(t,x_values)
title('K = 500 d = 150')
xlabel('time [m]')
ylabel('x(t) [m]')
disp("The final displacement")
x_values(p)