function INTAB = rocketBuilder()
%This is how to call the format builder once we have the proper data.
%INTAB=intab builder(n1,c1,c2,t1,pm1,pm2,Motor) 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% while loop for rocket builder 
disp('Enter the number for which component you would like to enter');
disp('1) Nose Cone');
disp('2) Cylinders');
disp('3) Tubes');
disp('4) Conical Transitions');
disp('5) Point Masses');
disp('6) Parachutes');
disp('7) Motor');
disp('8) Save current build');
disp('9) Use a saved build');
disp('10) Exit');

n = input(':> ','s');

%% Counters for parts
numNoseCone = 0;
numCylinders = 0; 
numTubes = 0;
numConicalTransitions = 0;
numPointMasses = 0;
numParachutes = 0;
switch n
%%  
    case 1 % nosecone     
        
        disp('Enter the length of the nose cone from tip to base');
        length = input(':> ', 's');
        
        disp('Enter the diamter at the base of the cone')
        base  = input(':> ', 's');
        
        disp('Enter the mass of the cone')
        mass  = input(':> ', 's');
        
        n1 = {'nose','ogive',str2num(length),str2num(base),str2num(mass),0};
%%    
    case 2 % cylinders       

        disp('Does this cylinder form part of the outter surface of the rocket? yes or no');
        out = input(':> ', 's');
        
        disp('Enter the length of the cylinder');
        length = input(':> ', 's');
        
        disp('Enter the diamter at the base of the cone');
        dia  = input(':> ', 's');
        
        disp('Enter the mass of the cylinder');
        mass = input(': >', 's');
        
        disp('Enter the position of the cylinder from the tip of the nose cone');
        pos = input(':> ', 's');
        
        c = {'cylinder',out,str2num(length),str2num(dia),str2num(mass),str2num(pos)};
        
%%       
    case 3 % tubes         
        disp('Does this tube form part of the outter surface of the rocket? yes or no');
        out = input(':> ','s');
        
        disp('Enter the length of the tube');
        length = input(':> ', 's');
        
        disp('Enter the inner diameter of the tube');
        Id = input(':> ','s');
        
        disp('Enter the outter diameter of the tube');
        Od = input(':> ', 's');
        
        disp('Enter the mass of the tube');
        mass = input(':> ', 's');
        
        disp('Enter the position of the tube from the tip of the nose cone');
        pos = input(':> ', 's');
        
        t = {'tube',out,str2num(length),str2num(Id),str2num(Od),str2num(mass),str2num(pos)};

    case 4 % conical transitions 
    
    disp('Enter the name of the conical transition');
    conTrans = input(':> ','s');
        
    disp('Enter the upstream diameter');
    upD = input(':> ', 's');
        
    disp('Enter the downstream diameter');
    downD = input(':> ','s');
        
    disp('Enter the maximum body diameter');
    dia = input(':> ', 's');
        
    disp('Enter the length');
    l = input(':> ', 's');    

    disp('Enter the mass of the tube');
    mass = input(':> ', 's');
        
    disp('Enter the position of the transition from the tip of the nose cone');
    pos = input(':> ', 's');
        
    t = {conTrans,str2num(upD),str2num(downD),str2num(dia),str2num(l),str2num(mass),str2num(pos)};
    
    case 5 % point masses 
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
    case 6 % parachutes
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

    end
    
    case 8 % load a previously saved rocket
        disp('Enter a name for your rocket')
        n = input(':> ','s');  
        save(n,'INTAB.mat');
    case 9 % load a previously saved rocket
        disp('Enter the name of your saved rocket. (ex. rocket.mat)');
        n = input(':> ','s');
        INTAB = load(n);
        
    case 10 % exit
        disp('Exiting');    
end 