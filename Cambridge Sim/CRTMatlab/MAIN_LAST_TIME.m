%{
Rocket Simulator for LRA 
Author: Alex Witt
Date: (2018-2019)
%}
%% Prepare workspace 
clear all; clc; format compact

%% Ask if user wants to specify coordinates for weather search or used presaved coordinates for T or C, NM. (Launch site city).

choice = true;
while choice 
    
    disp('1) Use built in SAC launch coordinates');
    disp('2) Use built in Apache Pass launch coordinates');
    disp('3) Enter different coordinates');
    disp('4) Exit');
    choice = input(':> ','s');
    choice = str2num(choice);
    
    if choice == 1
        %use built in 
        coords = [35.0000,-110.000,-105.000,31.0000];
        choice = false;
    
    elseif choice == 2
        coords = [33.0000,-110.000,-109.000,32.0000];
        choice = false;   
        
    elseif choice == 3
        weatherGrabbed = true;
        
        while weatherGrabbed 
            disp('Please enter a longitude and latitude grid for which you want to find weather data.');
            disp('FORMAT: north west east south.');
            coords = input(':> ','s');
            coords = str2num(coords);
    
            % Check to make sure 4 coordinates entered
            if length(coords) ~= 4
                disp('Please make sure you entered 4 coordinates!');       
            else 
                weatherGrabbed = false;
            end 
        end
        
        choice = false;
    elseif choice == 4
        coords = 4;
        choice = false;
        break;
    
    else
        error('Incorrect selection');
    end 
    
end 

%% Call function that downloads the weather data 

if length(coords) == 4
    disp('Would you like to download the recent weather data? (yes or no)');
    answer = input(':> ', 's');
    new = true;
    while new 
        if strcmp(answer, 'yes')
            disp('Downloading the weather...');
            INTAB4 = getWeather(coords);
            save('INTAB4.mat','INTAB4');
            new = false;
        else
            load('INTAB4.mat');
            new = false;
        end 
    end 
end 

%% Prompt to build rocket
if length(coords) == 4
    INTAB = rocketBuilder();
end 
%% Run simulator
if length(coords) == 4
    LRA_SIM(INTAB4)
end 
