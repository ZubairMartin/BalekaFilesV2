function [B,activateTrajectories]  = Controller(Gains,theta_ML,theta_MR,dtheta_ML,dtheta_MR)
    
    startButton = Gains.startButton;
    r_IC = Gains.r_IC;
    phi_IC = Gains.phi_IC;
    dr_IC = Gains.dr_IC; 
    dphi_IC = Gains.dphi_IC; 
    Kp_r_IC = Gains.Kp_r_IC; 
    Kd_r_IC = Gains.Kd_r_IC;
    Kp_phi_IC = Gains.Kp_phi_IC;
    Kd_phi_IC = Gains.Kd_phi_IC;

    [JT11,JT12,JT21,JT22] = Jacobian_Transpose(theta_ML,theta_MR);
    [r,phi,dr,dphi,left_knee,right_knee] = ConvertToPolar(theta_ML,theta_MR,dtheta_ML,dtheta_MR);
    JT = [JT11,JT12;JT21,JT22];

    activateTrajectories = 0;

    if startButton == 0
        % 0 = Rest
        w = [0;0];
        B = JT*w;

    elseif startButton == 1
        % 1 = Impedence control
        E = [r_IC - r; phi_IC - phi];
        dE = [dr_IC - dr; dphi_IC - dphi];
        wr = Kp_r_IC*E(1) + Kd_r_IC*dE(1);
        wphi = Kp_phi_IC*E(2) + Kd_phi_IC*dE(2);
        w = [wr;wphi];
        B = JT*w;

    else

        activateTrajectories = 1;
        w = [0;0];
        B = JT*w;

    end

end