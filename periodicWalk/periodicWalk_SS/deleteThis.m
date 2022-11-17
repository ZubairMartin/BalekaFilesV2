TT = 0.8;
mu_s = 0.5;
mu_k = 0.4;
V_avg = 0.4*sqrt(0.38*9.8);
TT = TT*2*loopLen;

% mu_s = 0.9;
% mu_k = 0.7;

tests = ["torque_test3", "mid_walk_thbod_locked_v9_looped","SS_N100_mu05"];
test = tests(3);
rawData = readtable(test+".csv");
dataLen = height(rawData);

loopLen = dataLen/200;
n = rawData(1:dataLen,"node");
thULA = rawData(1:dataLen,"thULA");
thURA = rawData(1:dataLen,"thURA");
thULB = rawData(1:dataLen,"thULB");
thURB = rawData(1:dataLen,"thURB");

dthULA = rawData(1:dataLen,"dthULA");
dthURA = rawData(1:dataLen,"dthURA");
dthULB = rawData(1:dataLen,"dthULB");
dthURB = rawData(1:dataLen,"dthURB");

tLeftA = rawData(1:dataLen,"tLeftA");
tLeftB = rawData(1:dataLen,"tLeftB");
tRightA = rawData(1:dataLen,"tRightA");
tRightB = rawData(1:dataLen,"tRightB");

n = table2array(n);
thULA = table2array(thULA);
thURA = table2array(thURA);
thULB = table2array(thULB);
thURB = table2array(thURB);

dthULA = table2array(dthULA);
dthURA = table2array(dthURA);
dthULB = table2array(dthULB);
dthURB = table2array(dthURB);

tLeftA = table2array(tLeftA);
tLeftB = table2array(tLeftB);
tRightA = table2array(tRightA);
tRightB = table2array(tRightB);



%4746 = Nan

t = [0:TT/(dataLen-1):TT];
t = transpose(t);

%tInterp = linspace(0,loopLen,500*loopLen);
tInterp = linspace(0,TT,communication_rate*loopLen);
thULAi = interp1(t,thULA,tInterp);
thURAi = interp1(t,thURA,tInterp);
thULBi = interp1(t,thULB,tInterp);
thURBi = interp1(t,thURB,tInterp);

dthULAi = interp1(t,dthULA,tInterp);
dthURAi = interp1(t,dthURA,tInterp);
dthULBi = interp1(t,dthULB,tInterp);
dthURBi = interp1(t,dthURB,tInterp);

tLeftAi = interp1(t,tLeftA,tInterp)';
tLeftBi = interp1(t,tLeftB,tInterp)';
tRightAi = interp1(t,tRightA,tInterp)';
tRightBi = interp1(t,tRightB,tInterp)';

ti = tInterp;
ti = ti';

zero_offset = 0.9;

thULA = (-thULAi-zero_offset);
thURA = (pi-thURAi+zero_offset);

thULB = (-thULBi-zero_offset);
thURB = (pi-thURBi+zero_offset);

thULA = thULA';
thURA = thURA';
thULB = thULB';
thURB = thURB';

dthULA = -dthULAi';
dthURA = -dthURAi';
dthULB = -dthULBi';
dthURB = -dthURBi';
     
for i = 1:1:5
    thULB = cat(1,thULB,thULB);
    dthULB = cat(1,dthULB,dthULB);
    tLeftBi = cat(1,tLeftBi,tLeftBi);
    thURB = cat(1,thURB,thURB);
    dthURB = cat(1,dthURB,dthURB);
    tRightBi = cat(1,tRightBi,tRightBi);
    thURA = cat(1,thURA,thURA);
    dthURA = cat(1,dthURA,dthURA);
    tRightAi = cat(1,tRightAi,tRightAi);
    thULA = cat(1,thULA,thULA);
    dthULA = cat(1,dthULA,dthULA);
    tLeftAi = cat(1,tLeftAi,tLeftAi);
end

M1_pos = struct('values', thULB);
M1_vel = struct('values', dthULB);
M1_tau = struct('values', tLeftBi);

M4_pos = struct('values', thURB);
M4_vel = struct('values', dthURB);
M4_tau = struct('values', tRightBi);

M3_pos = struct('values', thURA);
M3_vel = struct('values', dthURA);
M3_tau = struct('values', tRightAi);

M2_pos = struct('values', thULA);
M2_vel = struct('values', dthULA);
M2_tau = struct('values', tLeftAi);

M1_arr = struct('time', [], 'signals',M1_pos);
dM1_arr = struct('time', [], 'signals',M1_vel);
tM1_arr = struct('time', [], 'signals',M1_tau);

M4_arr = struct('time', [], 'signals',M4_pos);
dM4_arr = struct('time', [], 'signals',M4_vel);
tM4_arr = struct('time', [], 'signals',M4_tau);

M3_arr = struct('time', [], 'signals',M3_pos);
dM3_arr = struct('time', [], 'signals',M3_vel);
tM3_arr = struct('time', [], 'signals',M3_tau);

M2_arr = struct('time', [], 'signals',M2_pos);
dM2_arr = struct('time', [], 'signals',M2_vel);
tM2_arr = struct('time', [], 'signals',M2_tau);
