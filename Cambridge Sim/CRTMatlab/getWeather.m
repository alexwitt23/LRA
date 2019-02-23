function INTAB4 = getWeather(coords)
%% Take User Lat Long and search database

north = num2str(coords(1));
west = num2str(coords(2));
east = num2str(coords(3));
south = num2str(coords(4));

%% Temperature
urlT = 'http://thredds.ucar.edu/thredds/ncss/grib/NCEP/GFS/Global_0p5deg/best?north=&west=&east=&south=&time_start=present&time_duration=P3D&accept=netcdf&var=Temperature_isobaric&disableLLSubset=on&disableProjSubset=on&horizStride=1';

urlT = insertAfter(urlT, 'north=',north);
urlT = insertAfter(urlT, 'west=',west);
urlT = insertAfter(urlT, 'east=',east);
urlT = insertAfter(urlT, 'south=',south);

options = weboptions('Timeout',50);
outfilenameT = websave('weatherT.nc',urlT,options);

%% UWind
urlU = 'http://thredds.ucar.edu/thredds/ncss/grib/NCEP/GFS/Global_0p5deg/best?north=&west=&east=&south=&time_start=present&time_duration=P3D&accept=netcdf&var=u-component_of_wind_isobaric&disableLLSubset=on&disableProjSubset=on&horizStride=1';
urlU = insertAfter(urlU, 'north=',north);
urlU = insertAfter(urlU, 'west=',west);
urlU = insertAfter(urlU, 'east=',east);
urlU = insertAfter(urlU, 'south=',south);

outfilenameU = websave('weatherU.nc',urlU,options);

%% VWind
urlV = 'http://thredds.ucar.edu/thredds/ncss/grib/NCEP/GFS/Global_0p5deg/best?north=&west=&east=&south=&time_start=present&time_duration=P3D&accept=netcdf&var=v-component_of_wind_isobaric&disableLLSubset=on&disableProjSubset=on&horizStride=1';
urlV = insertAfter(urlV, 'north=',north);
urlV = insertAfter(urlV, 'west=',west);
urlV = insertAfter(urlV, 'east=',east);
urlV = insertAfter(urlV, 'south=',south);

outfilenameV = websave('weatherV.nc',urlV,options);

%% Geopotential height
geoP = 'http://thredds.ucar.edu/thredds/ncss/grib/NCEP/GFS/Global_0p5deg/best?north=&west=&east=&south=&time_start=present&time_duration=P3D&accept=netcdf&var=Geopotential_height_isobaric&disableLLSubset=on&disableProjSubset=on&horizStride=1';
geoP = insertAfter(geoP, 'north=',north);
geoP = insertAfter(geoP, 'west=',west);
geoP = insertAfter(geoP, 'east=',east);
geoP = insertAfter(geoP, 'south=',south);

outfilenameV = websave('weatherH.nc',geoP,options);

%% After downloading we can now read the data

%ncdisp('weatherU'); % this would show the structure of the netcdf file
temp = ncread('weatherT.nc','Temperature_isobaric');

pressure = ncread('weatherH.nc','Geopotential_height_isobaric');

windU = ncread('weatherU.nc','u-component_of_wind_isobaric');

windV = ncread('weatherV.nc','v-component_of_wind_isobaric');


isobaric =[100.0 200.0 300.0 500.0 700.0 1000.0 2000.0 3000.0 5000.0 ...
          7000.0 10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 40000.0 ...
          45000.0 50000.0 55000.0 60000.0 65000.0 70000.0 75000.0 80000.0 ...
          85000.0 90000.0 92500.0 95000.0 97500.0 100000.0]; % Pa 
        
        
%% Now we need to average over the coordinate space and time

% temperature
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

% Uwind
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

% Vwind
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

% Pressure Levels
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

%% Format weather for simulation 
INTAB4 = weatherConditions(windUH,windVH,tempH,isobaric);

end 
