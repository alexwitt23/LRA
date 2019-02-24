function [INTAB4]=weatherConditions(windUH,windVH,tempH,pressureH);
%adjust information to include ground level

windUH = [0 windUH];
windVH = [-20 windVH];
tempH = [tempH(1) tempH];
pressureH = [0 pressureH];


%% Calculate Height
% calculate height from pressure 
height = @(p) ((10^5)/(-2.25577)).*(-1+(p./101325).^(1/5.25588));

heightH = height(pressureH);

%% Calculate density 

density = pressureH./(287.*tempH);
%% NEED TO CALCULATE:
% DENSITY FROM HEIGHT AND PRESSURE
% HEIGHT FROM PRESSURE

%Build Input table********************************************************

INTAB4(:,1)=[0 flip(heightH)];
INTAB4(:,2)=[15 flip(windUH)];
INTAB4(:,3)=[15 flip(windVH)];
%INTAB4(:,4)=zeros(39,1);
INTAB4(:,4)=flip(zeros(30,1));
INTAB4(:,5)=flip(density);
INTAB4(:,6)=flip(tempH);

%Alternative height calculation******************************************
%ht_alt=(288.15/0.0065).*(1-(P_rho./P_surf).^(287*0.0065/9.81));
%h = @(p) ((10^5)/(-2.25577)).*(-1+(p./101325).^(1/5.25588));