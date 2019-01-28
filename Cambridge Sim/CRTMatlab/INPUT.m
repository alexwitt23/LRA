%{ 

%This is how to call theformat builder once we have the proper data.
INTAB=intab builder(n1,c1,c2,t1,pm1,pm2,Motor) 

%%NOSE CONE
n1={‘nose’,‘ogive’,L,d,M,X}
L: length of nose cone
d: diameter at the base
M: mass of the nose cone in kg
X: distance of the foremost part of the nose cone to the foremost part of
the rocket--usually 0.

%% CYLINDERS
c1={‘cylinder’,‘yes’,L,d,M,X} % the string ‘yes’ identi?es that the outer surface of the cylinder forms part of the rocket’s body surface
L: length
d: diameter
M: mass in kg
X: position of the cylinder. Position is taken as the distance from the
nose cone tip to the foremost part of the cylinder body.

(Cylinder is solid like an engine without fuel)

%% TUBES 
t1={‘tube’,‘yes’,L,Id,Od,M,X} % the string ‘yes’ identi?es that the outer surface of the cylinder forms part of the rocket’s body surface
L: length 
Id: inner diameter
Od: outter diameter
M: mass in kg
X: position of the tube in the rocket

%% CONICAL TRANSITIONS
ct1={‘cone trans’,‘yes’,Ud,Dd,dr,L,M,X}% the string ‘yes’ identi?es that the outer surface of the cylinder forms part of the rocket’s body surface
Ud: upstream diameter
Dd: downstream diamtere
dr: maximum body diameter
L: length 
M: mass
X: position

%% POINT MASSES 
pm1={‘pm’,M,Xr,Xl}
M: mass
Xr: radial position from the rocket axis
Xl: logitudinal position from the nose tip

%% PARACHUTES
p1={‘parachute’,Cd,Ap,M,X}
Cd: Drag Coefficient 
Ap: parachute area 
M: mass
X: position in the rocket

%%FIN SETS
f1={‘finset’,n,a,b,m,s,t,M,d,dr,X}
n: number of fins
a: fin root chord
b: fin tip chord 
m: fin sweep length
s: fin span
t: fin thickness
M: mass of the finset
d: body diameter at the fin's location 
dr: maximum body diameter 
x: position of the finset

%%MOTOR
Motor={‘motor’,‘K660’,Ttable,length,diameter,X}
Ttable: thrust-time data for the motor where the table is arranged as
follows: 
    Time (s) | Thrust (N) | Mass (kg) 
length: length of the motor
X: position of the motor


%}
