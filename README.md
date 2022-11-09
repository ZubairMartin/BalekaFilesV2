# BalekaFilesV2
This repo stores the updated Baleka files from the 8 November 2022.

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
1. Body scaling
2. Solve using absolute angles
3. Radau
4. Model PD controller - to select Kp and Kd
5. Stribeck friction
6. Joint friction
7. Adjust link angle limits
8. Min torque
9. Reduce max change in torque
10. Cost of transport

### Raibert Control
1. Alternate walking
2. Alternate hopping
