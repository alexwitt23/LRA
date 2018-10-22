/*************************************************************************
PURPOSE: (Rocket Structure)
LIBRARY DEPENDENCIES:
    (
     (rocket/src/rocket.o)
    )
**************************************************************************/

#ifndef _rocket_hh_
#define _rocket_hh_
#include "sim_services/Integrator/include/regula_falsi.h"

class Rocket {

    public:
        double altitude ;                    /* m     xyz-position */
        double velocity ;                    /* m/s   xyz-velocity */
        double acceleration ;                /* m/s2  xyz-acceleration  */

	double thrust; 			     /* kg.m/s2 */

        double area;                         /* m2 */
        double Cd;                           /* -- */

        double mass;                         /* kg */
	double mdot;			     /* kg/s */
	double massBurn; 		     /* kg */
	double mass0;			     /* kg */

        bool touchDown;                      /* -- */

        REGULA_FALSI rf ;

        int default_data();
        int state_init();
        int state_deriv();
        int state_integ();
	double touch_down(double groundAltitude);
};

#endif
