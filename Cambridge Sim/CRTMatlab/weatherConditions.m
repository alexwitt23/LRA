function [INTAB4]=weatherConditions(windUH,windVH,tempH,isobaric)
%% Need to prompt user for the current wind and temp 
disp('https://weather.com/weather/tenday/l/87901:4:US');
disp('Please enter the current eastern (U) and northern (V) components of wind (mph) and the temp at launch site (F)');

info = input(':> ','s');

info = str2num(info);

windU0 = info(1) * .44704;         % mph to m/s
windV0 = info(2) * .44704;         % mph to m/s
temp0 = (info(3) + 459.67)*(5/9);  % F to K


%% Preprocess
isobaric = [isobaric 101325];
windUH = [windUH windU0];
windVH = [windVH windV0];
tempH =  [tempH temp0];
placeHolder = zeros(32,1);


%% Calculate Height
% calculate height from pressure 
height = @(isobaric) ((10^5)/(-2.25577)).*(-1+(isobaric./101325).^(1/5.25588));

heightH = height(isobaric);

%% Calculate density 

density = isobaric./(287.*tempH);

density = [density];

%% NEED TO CALCULATE:
% DENSITY FROM HEIGHT AND PRESSURE

% HEIGHT FROM PRESSURE
%Build Input table*******************************************************


INTAB4(:,1)=flip(heightH);
INTAB4(:,2)=flip(windUH);
INTAB4(:,3)=flip(windVH);
%INTAB4(:,4)=zeros(39,1);
INTAB4(:,4)=flip(placeHolder);
INTAB4(:,5)=flip(density);
INTAB4(:,6)=flip(tempH);

%Alternative height calculation******************************************
%ht_alt=(288.15/0.0065).*(1-(P_rho./P_surf).^(287*0.0065/9.81));
%h = @(p) ((10^5)/(-2.25577)).*(-1+(p./101325).^(1/5.25588));