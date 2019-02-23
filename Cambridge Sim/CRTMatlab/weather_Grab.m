clear all; clc;

% x,y,VALUE,time

%% WORKS
%{
http://thredds.ucar.edu/thredds/ncss/grib/NCEP/GFS/Global_0p5deg/best?north=47.0126&west=-114.841&east=-112.641&south=44.8534&
time_start=present&time_duration=PT3H&accept=netcdf&var=v-component_of_wind_height_above_ground,u-component_of_wind_height_above_ground
%}

% GET THIS TO WORK
%% Temp
%{
http://thredds.ucar.edu/thredds/ncss/grib/NCEP/GFS/Global_0p5deg/best?north=35.0000&west=-110.000&east=-105.000&south=31.0000&
time_start=present&time_duration=PT3H&accept=netcdf&var=Temperature_isobaric&disableLLSubset=on&disableProjSubset=on&horizStride=1
%}
%% U wind
%{
http://thredds.ucar.edu/thredds/ncss/grib/NCEP/GFS/Global_0p5deg/best?north=35.0000&west=-110.000&east=-105.000&south=31.0000&
time_start=present&time_duration=PT3H&accept=netcdf&var=u-component_of_wind_isobaric&disableLLSubset=on&disableProjSubset=on&horizStride=1
%}
%% V wind
%{
http://thredds.ucar.edu/thredds/ncss/grib/NCEP/GFS/Global_0p5deg/best?north=35.0000&west=-110.000&east=-105.000&south=31.0000&
time_start=present&time_duration=PT3H&accept=netcdf&var=v-component_of_wind_isobaric&disableLLSubset=on&disableProjSubset=on&horizStride=1
%}

%% Geopotential height?
%{
http://thredds.ucar.edu/thredds/ncss/grib/NCEP/GFS/Global_0p5deg/best?north=35.0000&west=-110.000&east=-105.000&south=31.0000&
time_start=present&time_duration=PT3H&accept=netcdf&var=Geopotential_height_isobaric&disableLLSubset=on&disableProjSubset=on&horizStride=1
%}
Geopotential_height_isobaric&disableLLSubset=on&disableProjSubset=on&horizStride=1

%%
%ncdisp('bestT.nc');
temp = ncread('bestT.nc','Temperature_isobaric');


%ncdisp('bestH.nc');
pressure = ncread('bestH.nc','Geopotential_height_isobaric');


%ncdisp('bestU.nc');
windU = ncread('bestU.nc','u-component_of_wind_isobaric');


%ncdisp('bestV.nc');
windV = ncread('bestV.nc','v-component_of_wind_isobaric');


isobaric = [10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 ...
            40000.0 45000.0 50000.0 52500.0 55000.0 57500.0 ...
            60000.0 62500.0 65000.0 67500.0 70000.0 72500.0 ...
            75000.0 77500.0 80000.0 82500.0 85000.0 87500.0 ...
            90000.0 92500.0 95000.0 97500.0 100000.0]; %Pa 
%{
figure; hold on;

for i = 29:-1:1
    test = temp(:,:,:,i);
    [X,Y] = meshgrid(linspace(31,35,13),linspace(245,255,16));
    surf(X,Y,test(:,:,i));
end 
colorbar
view(17,22)

set(gca, 'ZDir', 'reverse')
%}
%'dd-mmm-yyyy'    

%p = 101325*(1 - (2.25577*(10^(-5))*h))^(5.25588);

%calculate height based on isobaric levels

h = @(p) ((10^5)/(-2.25577)).*(-1+(p./101325).^(1/5.25588));

%%  WHAT INFO DO WE HAVE

% TEMP AT ISOBARIC LEVELS
% ISOBARIC LEVELS (Pa) ---> TURNED INTO HEIGHT 
% UWIND AT ISOBARIC LEVELS
% VWIND AT ISOBARIC LEVELS
% BASED ON TEMP AND PRESSURE ---> DENSITY



%% temperature
[x,y,p,t] = size(temp);
tempt = zeros(1,t);
tempH = zeros(1,p);

for i = 1:p % iterate over each pressure level   
    
    for j = 1:t % average over the entire time sample
        
        % this averages the pressure at (i) isobaric levels 
        tempt(j) = mean2(temp(:,:,i,j));
   
    end 
    tempH(i) = mean(tempt);
end

%% Uwind
[x,y,p,t] = size(windU);
windUt = zeros(1,t);
windUH = zeros(1,p);

for i = 1:p % iterate over each pressure level   
    
    for j = 1:t % average over the entire time sample
        
        % this averages the pressure at (i) isobaric levels 
        windUt(j) = mean2(windU(:,:,i,j));
   
    end 
    windUH(i) = mean(windUt);
end

%% Vwind
[x,y,p,t] = size(windV);
windVt = zeros(1,t);
windVH = zeros(1,p);

for i = 1:p % iterate over each pressure level   
    
    for j = 1:t % average over the entire time sample
        
        % this averages the pressure at (i) isobaric levels 
        windVt(j) = mean2(windV(:,:,i,j));
   
    end 
    windVH(i) = mean(windVt);
end

%% Pressure Levels
[x,y,p,t] = size(pressure);
pressuret = zeros(1,t);
pressureH = zeros(1,p);

for i = 1:p % iterate over each pressure level   
    
    for j = 1:t % average over the entire time sample
        
        % this averages the pressure at (i) isobaric levels 
        pressuret(j) = mean2(pressure(:,:,i,j));
   
    end 
    pressureH(i) = mean(pressuret);
end


INTAB4 = weatherConditions(windUH,windVH,tempH,isobaric);

LRA_SIM(INTAB4)