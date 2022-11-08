clc; clear all;
writerObj = VideoWriter('circle3.avi');
writerObj.FrameRate = 20;
open(writerObj);

t = [linspace(0,90,10),linspace(90,180,10),linspace(180,270,10),linspace(270,360,10)];  % 40 points [10 seconds]
simTime = 3+(3*10);
t = [linspace(90,90,20),linspace(270,270,20)];  % 40 points [10 seconds]
simTime = 3+(3*10);

% t = [linspace(0,90,5),linspace(90,180,5),linspace(180,270,5),linspace(270,360,5)]; % 20 points [4 seconds]
% simTime = 3+(3*4);
counter = length(t);

theta1_final_tmp = zeros(counter,0);
theta2_final_tmp = zeros(counter,0);
index = 0;
[L1,L2,L3,L4,L5,L6,mu] = linkLengths ();
zero_origin_opp = 2.23; % rad

desired_coordinates = zeros(counter,2);
actual_coordinates = zeros(counter,2);
change_x = zeros(counter);
change_y = zeros(counter);


for i = 1:counter
       
    X_foot = 0.12*cos(t(i)*pi/180);
    Y_foot = -(0.12*sin(t(i)*pi/180)-0.35);
    xf = X_foot;
    yf = Y_foot;
    desired_coordinates(i,1) = xf;
    desired_coordinates(i,2) = yf;

    r = Y_foot;
    p = L5/2 - X_foot; 

    lamda = atan2(r,p);

    c2 = sqrt( (X_foot - L5/2)^2 + (Y_foot)^2);

    a = sqrt( (L6)^2 + (L3)^2 - 2*(L6)*(L3)*cos(mu) );
    phi =  asin(L3*(sin(mu)/a));

    alpha2 = acos( ((a)^2-(L2)^2-(c2)^2) / (-2*(L2)*(c2)) );
    epsilon = asin(L2*(sin(alpha2)/a));
    omega = pi - (phi + lamda-epsilon);
    X_joint = X_foot - L6*cos(omega);
    Y_joint = Y_foot - L6*sin(omega);

    c1 = sqrt( (X_joint + L5/2)^2 + (Y_joint)^2);
    alpha1 = acos( ((L4)^2-(L1)^2-(c1)^2) / (-2*(L1)*(c1)) );

    mc1 = (Y_joint/(X_joint + L5/2));
    cint1 = mc1*L5/2;

    mc2 = (Y_foot/(X_foot - L5/2));
    cint2 = -mc2*L5/2;

    X_int = (cint2-cint1)/(mc1-mc2);
    Y_int = mc1*X_int + cint1;

    c1_extend = sqrt( (X_int + L5/2)^2 + (Y_int)^2);
    c2_extend = sqrt( (X_int - L5/2)^2 + (Y_int)^2);

    beta2 = acos( ((c1_extend)^2-(c2_extend)^2-(L5)^2) / (-2*(c2_extend)*(L5)) );
    beta1 = acos( ((c2_extend)^2-(c1_extend)^2-(L5)^2) / (-2*(c1_extend)*(L5)) );

    q1 = (pi - (alpha1+beta1));
    q2 = (beta2+alpha2);
    
%     theta1 = pi/2 - q1;
%     theta2 = pi/2 - q2;
    theta1 = -(zero_origin_opp-pi/2) - q1; 
    theta2 = (zero_origin_opp-pi/2) + pi - q2; 
    
    % Store angles
    theta1_final_tmp(i) = theta1;
    theta2_final_tmp(i) = theta2;
    
    % Display angles
    disp_theta1 = theta1*180/pi;
    disp_theta2 = theta2*180/pi;

    % --------------------------------------------------------- %
    
    [X_foot,Y_foot,B1,B2,X_joint,Y_joint] = FC(theta1,theta2);
    actual_coordinates(i,1) = X_foot;
    actual_coordinates(i,2) = Y_foot;
    
    change_x(i) = xf - X_foot;
    change_y(i) = yf - Y_foot;

    P1 = [-L5/2;0];
    P5 = [L5/2;0];
    P2 = [B1(1);B1(2)];
    P4 = [B2(1);B2(2)];
    P3 = [X_joint;Y_joint];    
    P6 = [X_foot;Y_foot];
    
    % convert to polar 
    P0 = [0;0];
    r = sqrt((X_foot)^2 + (Y_foot)^2);
    phi = atan2(X_foot,Y_foot);

    xpolar = r*sin(phi);
    ypolar = r*cos(phi);

    Polar = [xpolar;ypolar]; %[xpolar;ypolar];
    
    ani = subplot(1,1,1);

    % DRAW CIRCLES (joints)
    P0_circle = viscircles(P0',0.02,'Color','b');
    P7_circle = viscircles(Polar',0.02,'Color','b');
    P1_circle = viscircles(P1',0.03); %remain fixed
    P2_circle = viscircles(P2',0.01); %change position over time
    P3_circle = viscircles(P3',0.01); %change position over time
    P4_circle = viscircles(P4',0.01); %change position over time
    P5_circle = viscircles(P5',0.03);%remain fixed
    P6_circle = viscircles(P6',0.01);%remain fixed
    P10_circle = viscircles([xf;yf]',0.01,'Color','g');

    % CONNECT CIRCLES
    % bar = line(x,y)
    linewidth = 1.0;
    A_bar = line([P1(1) P2(1)],[P1(2) P2(2)],'LineStyle','--','LineWidth',linewidth);
    B_bar = line([P2(1) P3(1)],[P2(2) P3(2)],'LineStyle','--','LineWidth',linewidth);
    C_bar = line([P3(1) P4(1)],[P3(2) P4(2)],'LineStyle','--','LineWidth',linewidth);
    D_bar = line([P4(1) P5(1)],[P4(2) P5(2)],'LineStyle','--','LineWidth',linewidth);
    E_bar = line([P3(1) P6(1)],[P3(2) P6(2)],'LineStyle','--','LineWidth',linewidth);
    Polar_bar = line([P0(1) Polar(1)],[P0(2) Polar(2)],'Color','blue','LineStyle','-.','LineWidth',1.5);

    axis(ani,'equal');
    set(gca,'XLim',[-0.35 0.35],'YLim',[-0.1 0.5],'YDir','reverse');
    str2 = ['Time elapsed: '  num2str(t(i)) ' s'];
    Title = title(str2);
    pause(0.005);
   frame = getframe;
   writeVideo(writerObj,frame);
    if i<length(t)
        delete(P1_circle);
        delete(P2_circle);
        delete(P3_circle);
        delete(P4_circle);
        delete(P5_circle);
        %delete(P6_circle);
        %delete(P10_circle);
        delete(P7_circle);
        delete(Polar_bar);
        delete(A_bar);
        delete(B_bar);
        delete(C_bar);
        delete(D_bar);
        delete(E_bar);
        delete(Title);
        grid on;
    end

end

% Full rotation = 10 sconds (for 33 seconds it will be 3 rotations)
theta1_final = [theta1_final_tmp theta1_final_tmp theta1_final_tmp];
theta2_final = [theta2_final_tmp theta2_final_tmp theta2_final_tmp];
csvwrite('desired.csv',desired_coordinates);
csvwrite('actual.csv',actual_coordinates);

figure;
plot(linspace(1,40,40),change_x);
hold on
plot(linspace(1,40,40),change_y);

