# BalekaFilesV2
This repo stores the updated Baleka files from the 8 November 2022.

## FRIDAY TODO
1. max hop testing
2. baseline: mu = 1, N=50
3. Update mu, N, Kp and Kd to view differences


## URGENT - PYOMO
### With th_body = 0 (fixed)
Compare using Stacey Tuts
using : in function constraints

Notes: 
1. dx = dx+ - dx- gives the actual value and sign where dx = dx+ + dx- gives the magnitude (if there's any velocity at all)
2. h[1] is not needed as no link to model
3. Scale the entire system (N/bodyweight)
4. Double check everything (mass and inertias - compare Simscape and Pyomo)
5. Do hop test - compare TW and GRF curve of Simscape and Pyomo
6. Reduce Kp = 55 and Kd = 5
7. Increase nodes to check difference - check 0.01<hm<0.02 where hm = TT/N
8. Raibert control v NLF (or mimic pyomo traj using raibert control to include FB)
9. Can slip if Gx>uGy
10. Model foot deflection in pyomo
11. compare des v act in Simscape
12. pos = quad, vel = linear, acc = ZOH (interpolation)

1. Fix friction model - friction cone
2. Fix and understand h_sum: h[1] when tau[1] = 0 --> focus on the 
3. Double check torque curve
4. Foot (angle) implementation
5. Motor parameters 
4. Scale all variables correctly
5. Stribeck friction
6. Absolute Angles
7. Seeds


## To Do List:

### Speedgoat
1. Update Timestep correctly - increase it as much as possible <br />
  a. Find max Kp and Kd from impedence control <br />
  b. Adjust BW using R-Link if needed
2. Padding on robot
3. Raibert Control: <br />
  a. redo foot detection <br />
  b. Update stance time correctly from .matfile run <br />
  c. Update zeroing angle detection
4. Center point on upper links
5. Adjust CAN read and write files correctly - have a single function

### Simscape
1. Deflection test (1e4) and compare normal forces
2. Compare masses
3. Include fasteners in model

### Pyomo
#### Urgent
1. Body scaling
2. Min torque
3. Reduce max change in torque
4. Adjust link angle limits
5. Cost of transport
6. Stribeck friction
7. Seeds

#### On weekends
1. Get Immanuel Thesis
2. Radau
3. Virtual, magnitude and direction constraints
4. Model PD controller - to select Kp and Kd
5. Joint friction
6. Solve using absolute angles (with thB and without thB)

### Raibert Control
1. Alternate walking
2. Alternate hopping
