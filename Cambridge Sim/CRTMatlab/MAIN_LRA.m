%% Get weather info
%{
% lat and lon
north='35';
west='-110';
east='-105';
south='31';
% date of interest  
dateStart = '2019-02-15T03%3A00%3A00Z';
dateEnd   = '2019-02-16T03%3A00%3A00Z';
%http://thredds.ucar.edu/thredds/ncss/grib/NCEP/GFS/Global_0p5deg?var=Temperature_isobaric
%&var=u-component_of_wind_isobaric&var=v-component_of_wind_isobaric&north=35&west=-110&east=-105&south=31&horizStride=1
%&time_start=2019-01-10T00%3A00%3A00Z&time_end=2019-02-25T12%3A00%3A00Z&timeStride=1&vertStride=1&accept=netcdf

% four separate requests 

%temp
%Uwind
%Vwind
%pressure

[response,completedrequest,history] = send(request,uri);
%}
url = 'http://thredds.ucar.edu/thredds/ncss/grib/NCEP/GFS/Global_0p5deg?var=u-component_of_wind_isobaric&north=35&west=-110&east=-105&south=31&disableLLSubset=on&disableProjSubset=on&horizStride=1&time_start=2019-01-17T00%3A00%3A00Z&time_end=2019-03-04T18%3A00%3A00Z&timeStride=1&vertCoord=&accept=netcdf';
options = weboptions('Timeout',200);
outfilename = websave('TEST',url,options);
%[response,completedrequest,history] = send(request,uri);

%% Establish necessary rocket info
[windUH,windVH,tempH,isobaric]= weather_Grab();

INTAB4 = weatherConditions(windUH,windVH,tempH,isobaric);

%% Run the simulation

%LRA_SIM(INTAB4);