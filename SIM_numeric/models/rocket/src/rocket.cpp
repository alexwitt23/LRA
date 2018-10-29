/*
PURPOSE: ( Simulate a rocket from takeoff to apogee.)
Library DEPENDENCY:
	((rocket.o))
PROGRAMMERS:
	((Alex Witt)(Longhorn Rocketry Association)(October 2018))
*/

#include "../include/rocket.hh"
#include <iostream>
#include <cmath>


int Rocket::default_data() {
	
	thrust = 10000.0;
	area = 0.00817;
	Cd = .35300;

	mass0 = 250.0;
	mdot = 4.85705;
	massBurn = 0.0;
	mass = 250.0;

	velocity = 0.0;
	altitude = 0.0;

	apogee = false;
	
	return (0);
}

// Initialization job.
int Rocket::state_init() {
	return (0);
}

// Derivative job
int Rocket::state_deriv() {
	
		// Calculate forces and acceleration
		mass = (mass0 - massBurn);

		// Calculate Force of gravity
		double g = 9.81 * (6400000/(6400000 + altitude)) * (6400000/(6400000 + altitude));
		double Force_gravity = mass * -g;
		
		// Calculate Force of drag.
		double air_density = (101.29*(pow(((15.04-(0.00649*altitude))+273.1)/288.08,5.256))/(0.2869*(15.04-(0.00649*altitude)+273.1)));
		double Force_drag = -1 * Cd * 0.5 * air_density * velocity * velocity * area;
		
		
		// Caclulate Total Force.
		double Force_total;
		if ( !apogee ) {
			Force_total = Force_gravity + thrust + Force_drag;
			acceleration = Force_total / mass;
		} else {
			Force_total = 0.0;
			velocity = 0.0;
			acceleration = 0.0;
		}
		return(0);		
}

// Intergration 
#include "sim_services/Integrator/include/integrator_c_intf.h"
int Rocket::state_integ() {
	
	int integration_step;

	load_state( &massBurn, &altitude, &velocity, NULL);
	
	load_deriv ( &mdot, &velocity, &acceleration, NULL);

	integration_step = integrate();

	unload_state( &massBurn, &altitude, &velocity, NULL);
	
	return(integration_step);
}

double Rocket::touch_down(double groundAltitude) {
	double tgo ; 
	double now ;
	
	/* error function: how far the rocket velocity is from 0 */
	rf.error = altitude; 
	
	now = get_integ_time() ; 
	tgo = regula_falsi( now, &rf ) ;
	if (tgo == 0.0) {
		now = get_integ_time() ;
		reset_regula_falsi( now, &rf);
		velocity = 0.0;
		acceleration = 0.0;
		apogee = true;
		std::cout << "Apogee: time = " << now << "." << std::ends;
	}
	return( tgo ) ;
}
