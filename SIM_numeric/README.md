## SIM_rocket
Monte Carlo simulation to vary thrust force for variable altitude trajectories. 

Three forces on the rocket are considered: Gravity, drag, and thrust. 
## Forces
Gravity: Varies with altitude.
Drag: There are two drags associated with the simulation. The first drag considers the area and Cd of the rocket, and the force resists the upward acceleration of the rocket. Once the parachute is popped, the Cd and area are changed to that the drag resists the downward movement of the rocket. 
Thrust: Thurst force is constant, and the acceleration varies with a change in mass. Once the simulation time reaches burn out time, a dynamic event is used to hold the dry mass constant, and set the thrust force to 0. 

## Dynamic Events
This simulation is modeled by dynamic events, meaning events can be added to change the nature of the simulation while the simulation is running. 

Once such event is burn out of fuel. Once the fuel is completely burnt, the mass can be set to the constant dry mass, 
and the thrust can be set to zero. In this case, since we know the burnout time, we can prescribe the necessary changes 
at the burnout time. 

Alternatively, if we do not want to find the burn out time explicitly, we could set the dynamic event to look for the time when the mass reaches the dry mass value--hence no more fuel. Once this condition is met, the thrust can be set to zero and mass held constant 

A second dynamic is the deployment of the parachute. This occurs at a specifically designated time, and the Cd and area 
values are changed. 

Also, this dynamic event could be potentially set to be acitivated depending on the positition or velocity of the rocket. 
