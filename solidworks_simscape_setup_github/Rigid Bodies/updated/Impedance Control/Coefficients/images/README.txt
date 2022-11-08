Five tests were run at different Kp and Kd values (specifically for r) to determine the point at which the motors become unstable.

It was found that when the torque command oscillated between +1 and -1, the motors would overcome stiction and the error in the velocity term becomes too much
-------
Test 1
-------
Kp = 300
Kd = 200

-------
Test 2
-------
Kp = 500
Kd = 200

-------
Test 3
-------
Kp = 700
Kd = 200

-------
Test 4
-------
Kp = 1000
Kd = 190

-------
Test 5
-------
Kp = 3000
Kd = 190

Therefore, the max Kd is 190. We want to use half of that:

Kp = 700 (want some stiffness)
Kd = 90 (less than half is okay)