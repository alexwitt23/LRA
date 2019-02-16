function [INTAB4]=weatherConditons(windU,windV,temp,Year,Month,Day,hour,Lat,Long);

% %Inputs***************************************************************
% %Date and time
% Year=2006; %Format 'XXXX' eg 2006
% Month=06;  %Format 'XX' eg 05
% Day=10;    %Format 'XX' eg 06 
% hour=18;   %Format 'XX' options: 00, 06, 12, 18.
% 
% %Lat and Long
% Lat=52.9748;  %decimal format;
% Long=-0.3131; %decimal format; 
%********************************************************************


%Time and Date********************************************************

%get time origin
timelong=Uncdf{'t'}.time_origin(:);
timeshrt=timelong(1:11);
time_0=datenum(timeshrt,'dd-mmm-yyyy');

%get time of simulation
time_n=datenum([Year Month Day]);

date=time_n-time_0;
hournum=hour/24;

time=date+hournum;
%*********************************************************************
%% geopotential isobaric height??
h = mean(height, 4); %average height over the time 
%% uwind
uwin = mean(windU,4); %average u-wind over time
%% vwind
uwin = mean(windV,4); %average v-wind over time
%% temp
t = mean(temp,4); %average u-wind over time
%% 
height = (t + 131.21) ./.00299;
%calculate density rho at ht_rho levels using ideal gas law***************

rho=P_rho./(287*T_rho);

%Build Input table********************************************************
%{
INTAB4(:,1)=ht_rho;
INTAB4(:,2)=-U;
INTAB4(:,3)=-V;
INTAB4(:,4)=zeros(39,1);
INTAB4(:,5)=rho;
INTAB4(:,6)=T_rho;
%}
%Alternative height calculation******************************************
ht_alt=(288.15/0.0065).*(1-(P_rho./P_surf).^(287*0.0065/9.81));