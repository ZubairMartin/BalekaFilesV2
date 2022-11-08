function [X_foot,Y_foot,B1,B2,left_knee,right_knee] = FC(theta1,theta2)

    [L1,L2,L3,L4,L5,L6,mu] = linkLengths ();
    zero_origin_opp = 2.23; % rad
    
%     q1 =  pi/2 - theta1; 
%     q2 =  pi/2 - theta2;
    q1 = -(zero_origin_opp-pi/2) - theta1; 
    q2 = (zero_origin_opp-pi/2) + pi - theta2; 
        
    B1 = [-0.5*L5 - L1*cos(q1) ; L1*sin(q1)];
    B2 = [0.5*L5 + L2*cos(pi-q2) ; L2*sin(pi-q2)];
    
    a = abs(B1(1) - B2(1));
    b =  B1(2) - B2(2);
    B12 = sqrt(a^2 + b^2);
    
    %% Knee angle
    alpha = atan2(b,a);
    beta = acos( ((L4)^2 - (B12)^2 - (L3)^2)/(-2*(B12)*(L3)) );
    q3 = alpha + beta;
    
    % Angle between virtual leg and knee
    c = sqrt(L3^2 + L6^2 - 2*L3*L6*cos(mu)); % virtual leg
    lamda = asin(L6*(sin(mu)/c));

    % Finding the knee angles
    right_knee = q3 + pi/2 + theta2 - zero_origin_opp;
    q3_left = asin(L3*sin(beta)/L4);
    left_knee = (pi/2 - theta1) + (q3_left -alpha) - zero_origin_opp;
    

    % Final Output
    X_joint = L5/2 + L2*cos(pi-q2) - L3*cos(q3);
    Y_joint = L2*sin(pi-q2) + L3*sin(q3);

    X_foot = 0.5*L5 + L2*cos(pi-q2) - c*cos(q3+lamda);
    Y_foot = L2*sin(pi-q2) + c*sin(q3+lamda);
end