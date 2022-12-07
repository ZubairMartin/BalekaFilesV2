# BalekaFilesV2
This repo stores the updated Baleka files from the 8 November 2022.

## URGENT - PYOMO
### With th_body = 0 (fixed)
Compare using Stacey Tuts
using : in function constraints

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
