%% Notes

%{
x_body = right is +ve looking down the robot
The initial x = 0 is set globally - does not reset to zero after each run
ybody = 0.15 when robot on ground in rest state (up is +ve)
ybody = 0.198 when on force plate in rest state


Force vs ybody

Rest: ybody = 0.19753 ---> force = -52.7357
Push: 
    ybody = 0.19751 ---> force = -95.70936
    ybody = 0.19639 ---> force = -112.25110
    ybody = 0.19658 ---> force = -158.1081
    ybody = 0.19551---> force = -171.8397


    ybody = 0.1931 ---> force = -304.552
    ybody = 0.19522---> force = -151.98554
    ybody = 0.1958---> force = -114.8986
    ybody = 0.1969---> force = -63.440

%}

ybody = [0.19751;0.19639;0.19658; 0.19551;0.1931;0.19522;0.1958;0.1969];
force = [-95.70936;-112.25110;-158.1081;-171.8397;-304.552;-151.98554;-114.8986;-63.440];
kx = [0;0;0;0];
counter = 0;

for i = [1,3,5,7]
    counter = counter+1;
    kx(counter) = (force(i+1)-force(i))/(ybody(i+1)-ybody(i));
end
kx
mean(kx)