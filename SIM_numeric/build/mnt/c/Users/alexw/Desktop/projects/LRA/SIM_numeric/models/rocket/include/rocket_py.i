%module m67528b5919f90a46eeeb39e7c6323718

%include "trick/swig/trick_swig.i"


%insert("begin") %{
#include <Python.h>
#include <cstddef>
%}

%{
#include "/mnt/c/Users/alexw/Desktop/projects/LRA/SIM_numeric/models/rocket/include/rocket.hh"
%}

%trick_swig_class_typemap(Rocket, Rocket)




#ifndef _rocket_hh_
#define _rocket_hh_
%import(module="sim_services") "trick/regula_falsi.h"

class Rocket {

    public:
        double altitude ;                    

        double velocity ;                    

        double acceleration ;                


	double thrust; 			     


        double area;                         

        double Cd;                           


        double mass;                         

	double mdot;			     

	double massBurn; 		     

	double mass0;			     


        bool touchDown;                      


        REGULA_FALSI rf ;

        int default_data();
        int state_init();
        int state_deriv();
        int state_integ();
	double touch_down(double groundAltitude);
};
#define TRICK_SWIG_DEFINED_Rocket

#endif

#ifdef TRICK_SWIG_DEFINED_Rocket
%trick_cast_as(Rocket, Rocket)
#endif
