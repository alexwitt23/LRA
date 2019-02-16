function LRA_SIM(INTAB4)
%This is how to call the format builder once we have the proper data.
%INTAB=intab builder(n1,c1,c2,t1,pm1,pm2,Motor) 

%{
%%NOSE CONE
n1={�nose�,�ogive�,L,d,M,X}
L: length of nose cone
d: diameter at the base
M: mass of the nose cone in kg
X: distance of the foremost part of the nose cone to the foremost part of
the rocket--usually 0.
%}
%%%%%%%%%%%%%%%%%%
n1 = {'nose','ogive',0.508,0.102,0.420,0};
%%%%%%%%%%%%%%%%%%

%{
%% CYLINDERS
c1={�cylinder�,�yes�,L,d,M,X} % the string �yes� identi?es that the outer surface of the cylinder forms part of the rocket�s body surface
L: length
d: diameter
M: mass in kg
X: position of the cylinder. Position is taken as the distance from the
nose cone tip to the foremost part of the cylinder body.
%}
%%%%%%%%%%%%%%%%%%
%(Flight Computer + Components)
c1 = {'cylinder','no',.254,.045,1.361,.47};

%(Payload)
c2 = {'cylinder','no',.196,.0825,4.400,1.4};

%%%%%%%%%%%%%%%%%%

%(Cylinder is solid like an engine without fuel)

%{
%% TUBES 
t1={�tube�,�yes�,L,Id,Od,M,X} % the string �yes� identifies that the outer surface of the cylinder forms part of the rocket�s body surface
L: length 
Id: inner diameter
Od: outter diameter
M: mass in kg
X: position of the tube in the rocket
%}

%%%%%%%%%%%%%%%%%%
%(Payload Coupler between Nose and body1)
t1 = {'tube','no',.254,.0952,.0983,.218,.467};

%(body tube 1)
t2 = {'tube','yes',1.07,.0983,0.102,1.023,.508};

%(Payload between body1 and tail)
t3 = {'tube','no',.343,.0952,.0983,.294,1.4};

%(body tube 2)
t4 = {'tube','yes',.889,.0983,.102,.853,1.578};

%(motor tube)
t5 = {'tube','no',.572,.0753,.08,.605,1.89};
%%%%%%%%%%%%%%%%%%

%{
%% CONICAL TRANSITIONS
ct1={�cone trans�,�yes�,Ud,Dd,dr,L,M,X}% the string �yes� identi?es that the outer surface of the cylinder forms part of the rocket�s body surface
Ud: upstream diameter
Dd: downstream diamtere
dr: maximum body diameter
L: length 
M: mass
X: position
%}

%{
%% POINT MASSES 
pm1={�pm�,M,Xr,Xl}
M: mass
Xr: radial position from the rocket axis
Xl: logitudinal position from the nose tip
%}
%%%%%%%%%%%%%%%%%%
%(Big Heat Shield + Quicklinks)
pm1 = {'pm',.176,0,1.17};

%(Small Heat Shield + Quicklinks)
pm2 = {'pm',.108,0,1.37};
%%%%%%%%%%%%%%%%%%

%{
%% PARACHUTES
p1={�parachute�,Cd,Ap,M,X}
Cd: Drag Coefficient 
Ap: parachute area 
M: mass
X: position in the rocket
%}
%%%%%%%%%%%%%%%%%% (drogue goes before main)
%(DROGUE)
pd = {'parachute',1.5,.292246657,.0244,1.24};
%(MAIN)
p1 = {'parachute',1.89,1.81458,.363,.914};
%%%%%%%%%%%%%%%%%%

%{
%%FIN SETS
f1={�finset�,n,a,b,m,s,t,M,d,dr,X}
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
%}
%%%%%%%%%%%%%%%%%%
f1 = {'finset',4,.35,.19,.16,.222,.00318,.874,.102,.102,2.09};
%%%%%%%%%%%%%%%%%%

%{
%%MOTOR
Motor={�motor�,�K660�,Ttable,length,diameter,X}
Ttable: thrust-time data for the motor where the table is arranged as
follows: 
    Time (s) | Thrust (N) | Mass (kg) 


length: length of the motor
X: position of the motor
%}
%%%%%%%%%%%%%%%%%%
%Thrust table:
% Time (s) | Thrust (N) | Mass (kg)

%2010 (2010 is the dry mass)
time = [0,0.01,0.05,0.08,0.1,0.15,0.18,0.24,0.3,0.4,0.42,0.5,0.76,1.0,1.28,1.84,2.25,3.,3.5,3.92,4.,4.1,4.22,4.38,4.48,4.49] ;
Thrust = [0,45.46,522.52,984.04,1256.1,1389.85,1713.25,1515.65,1474.74,1443.28,1446.25,1430.02,1392.85,1361.7,1339.45,1259.35,1201.5,1076.11,990.86,832.85,607.78,434.99,288.73,156.49,86.39,0.0];
mass = .001* (2010 + [2394,2393.89,2388.35,2377.33,2366.4,2334.14,2311.44,2264.2,2220.45,2149.29,2135.2,2079.09,1900.11,1738.91,1554.48,1199.59,953.558,537.01, 284.994,98.2137, 70.1098,44.6817,23.5041,6.13332,0.210663,0.0]); 

%%
thrustUpper = 1.2*Thrust;
thrustLower = .8*Thrust;

thrustTotal = [thrustLower',Thrust',thrustUpper'];
dataDims = size(thrustTotal);
%% Simulation 

% number of iterations
noi = 10;
%launch altitude of drogue is at apogee

%launch of main 
altpd = 305;
%length of launch rail
R1 = .51;
%angle of the launch tower's declination from the vertical
Ra = 6;
%bearing degrees North to which the tower is pointing
Rb = 40;

for i = 1:1:dataDims(2)
    %with Ttable as:
    Ttable = [time',thrustTotal(:,i),mass'];
    Motor={'motor','l1115',Ttable,.621,.075,1.89};
    %%%%%%%%%%%%%%%%%%

    INTAB = intab_builder(n1,c1,c2,t1,t2,t3,t4,t5,pm1,pm2,p1,f1,Motor);
    [Asc,Des,Landing,Apogee] = rocketflight_monte(INTAB,INTAB4,altpd,R1,Ra,Rb,noi,pd);
    RESULTS.AscT.t{i} = Asc;
    RESULTS.DesT.t{i} = Des;
    RESULTS.LandingT.t{i} = Landing;
    RESULTS.ApogeeT.t{i} = Apogee;
end 
figure
ap1 = RESULTS.ApogeeT.t{1};
plot3(0,0,0,'bx',ap1(:,1),ap1(:,2),ap1(:,3),'r.');
hold on;

ap2 = RESULTS.ApogeeT.t{2};
plot3(0,0,0,'bx',ap2(:,1),ap2(:,2),ap2(:,3),'g.');

ap3 = RESULTS.ApogeeT.t{3};
plot3(0,0,0,'bx',ap3(:,1),ap3(:,2),ap3(:,3),'b.');


set(gca,'zlim',[0 (max(ap3(:,3))+100)]);
axis equal;
xlabel('East (m)');
ylabel('North (m)');
zlabel('Altitude (m)');
set(gca,'XGrid','on')
set(gca,'YGrid','on')
set(gca,'ZGrid','on')
title('apogee scatter pattern');
end 