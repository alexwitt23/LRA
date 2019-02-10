clear all; clc;

%{
http://thredds.ucar.edu/thredds/ncss/grib/NCEP/GFS/Global_0p5deg/best?
north=35.0000&west=-110.000&east=-105.000&south=31.0000
&time_end=present&time_duration=PT3H&cdf&var=v-component_of_wind_height_above_ground,
u-component_of_wind_height_above_ground,&accept=netcdf

http://thredds.ucar.edu/thredds/ncss/grib/NCEP/GFS/Global_0p5deg/best?
north=35.0000&west=-110.000&east=-105.000&south=31.0000
&accept=netcdf&var=Temperature_pressure&temporal=all

http://thredds.ucar.edu/thredds/ncss/grib/NCEP/GFS/Global_0p5deg/best?
north=35.0000&west=-110.000&east=-105.000&south=31.0000
&time_end=present&time_duration=P3D&accept=netcdf&var=v-component_of_wind_height_above_ground,
u-component_of_wind_height_above_ground,Temperature_sigma

http://thredds.ucar.edu/thredds/ncss/grib/NCEP/GFS/Pacific_40km/best/dataset.html

http://thredds.ucar.edu/thredds/ncss/grib/NCEP/GFS/Global_0p5deg/Temperature_pressure
http://thredds.ucar.edu/thredds/ncss/grib/NCEP/GFS/Global_0p5deg?var=Temperature_isobaric
&var=u-component_of_wind_isobaric&var=v-component_of_wind_isobaric&north=35&west=-110&east=-105&south=31&horizStride=1
&time_start=2019-01-10T00%3A00%3A00Z&time_end=2019-02-25T12%3A00%3A00Z&timeStride=1&vertStride=1&accept=netcdf

%}

%http://thredds.ucar.edu/thredds/ncss/grib/NCEP/GFS/Pacific_40km/best/dataset.html



%ncdisp('bestT.nc');
temp = ncread('bestT.nc','Temperature_isobaric');
temp1 = temp(:,:,:,1);

%ncdisp('bestH.nc');
height = ncread('bestH.nc','Geopotential_height_isobaric');
height1 = height(:,:,:,1);

%ncdisp('bestU.nc');
windU = ncread('bestU.nc','u-component_of_wind_isobaric');
windU1 = windU(:,:,:,1);

%ncdisp('bestV.nc');
windV = ncread('bestV.nc','v-component_of_wind_isobaric');
windV1 = windV(:,:,:,1);

iosbaric = [10000.0 15000.0 20000.0 25000.0 30000.0 35000.0 ...
            40000.0 45000.0 50000.0 52500.0 55000.0 57500.0 ...
            60000.0 62500.0 65000.0 67500.0 70000.0 72500.0 ...
            75000.0 77500.0 80000.0 82500.0 85000.0 87500.0 ...
            90000.0 92500.0 95000.0 97500.0 100000.0];
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

