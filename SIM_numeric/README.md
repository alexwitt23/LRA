## SIM_rocket
Monte Carlo simulation to vary thrust force for variable altitude trajectories. 

Three forces on the rocket are considered: Gravity, drag, and thrust. 

This simulation is modeled as a dynamic event, meaning events can be added to change the nature of the simulation. 

Once such event is burn out of fuel. Once the fuel is completely burnt, the mass can be set to the constant dry mass, 
and the thrust can be set to zero. In this case, since we know the burnout time, we can prescribe the necessary changes 
at the burnout time. 

A second dynamic is the deployment of the parachute. This occurs at a specifically designated time, and the Cd and area 
values are changed. 