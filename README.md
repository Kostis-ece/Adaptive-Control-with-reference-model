We have a linear system to be controlled. Our goal is to make the system behaves as a known system, which we call reference model. 
The theoritical analysis and design of the controllers is a matter of automated control theory. In this project, we see the matlab code which simulates the behaviour of the system with the controller in 3 cases.
A) The controller is designed knowing the vallues of the system's parameters and being able to measure u and x1.
B) The controller is desinged not knowing the vallues of the system's parameters and it is a (both) states feedback control scheme. (2)
C) The controller is desinged not knowing the vallues of the system's parameters and it is a (only one) state feedback control scheme. (x1  --> y , the exit of the system). (3)
The "symperifora" files are the system dynamics , and the "ektelesi" files are the "main" which simulate the behaviour of the system. (4)
It is usefull to see how to use the "ode" functions for simulating the behaviour of systems by solving their differential equations. 
