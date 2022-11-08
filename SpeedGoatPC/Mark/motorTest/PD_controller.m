function t = PD_controller(cmd,q,w,motors)
    if motors == 23
        Kp_new = -cmd.Kp;
        Kd_new = -cmd.Kd;
        q_new = cmd.q;
        w_new = cmd.w;
        tff_new = -cmd.tff;
    else
        Kp_new = cmd.Kp;
        Kd_new = cmd.Kd;
        q_new = cmd.q;
        w_new = cmd.w;
        tff_new = cmd.tff;
    end

    t = Kp_new*(q_new - q) + Kd_new*(w_new - w) + tff_new;
end
%function t = PD(cmd,q,w)
%t = cmd.Kp*(cmd.q - q) + cmd.Kd*(cmd.w - w) + cmd.tff;
