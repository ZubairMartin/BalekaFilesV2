tests = ["torque_test3", "mid_walk_thbod_locked_v9_looped","SS_N100"];
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

V_avg = 0.4*sqrt(0.38*9.8);
TT = 0.2*2*loopLen; %(0.8/V_avg)*loopLen;

%4746 = Nan

t = [0:TT/(dataLen-1):TT];
t = transpose(t);

%tInterp = linspace(0,loopLen,500*loopLen);
tInterp = linspace(0,TT,500*loopLen);
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

m3_pos = struct('values', thULB);
m3_vel = struct('values', dthULB);
m3_tau = struct('values', tLeftBi);

m2_pos = struct('values', thURB);
m2_vel = struct('values', dthURB);
m2_tau = struct('values', tRightBi);

m1_pos = struct('values', thURA);
m1_vel = struct('values', dthURA);
m1_tau = struct('values', tRightAi);

m4_pos = struct('values', thULA);
m4_vel = struct('values', dthULA);
m4_tau = struct('values', tLeftAi);

m3_arr = struct('time', [], 'signals',m3_pos);
dm3_arr = struct('time', [], 'signals',m3_vel);
tm3_arr = struct('time', [], 'signals',m3_tau);

m2_arr = struct('time', [], 'signals',m2_pos);
dm2_arr = struct('time', [], 'signals',m2_vel);
tm2_arr = struct('time', [], 'signals',m2_tau);

m1_arr = struct('time', [], 'signals',m1_pos);
dm1_arr = struct('time', [], 'signals',m1_vel);
tm1_arr = struct('time', [], 'signals',m1_tau);

m4_arr = struct('time', [], 'signals',m4_pos);
dm4_arr = struct('time', [], 'signals',m4_vel);
tm4_arr = struct('time', [], 'signals',m4_tau);
