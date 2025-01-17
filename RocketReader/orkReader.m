clear all; clc;

filename = 'COTS10K.xml';
file = xml2struct(filename);

%% Index of possible components
%{
nosecone

cylinders

tubes 
    motor tube
    tube coupler


conical transitions

point masses
    black power charge
    shockcord
    payload
    electronics
    airbrakes
parachutes 

finsets
    freeformfinset
motor

SKIP
    bulkhead
    simulations
%}
%% Nosecone

totalLength = 0; % Need to keep track major part lengths to record overall length

%Subcomponents
subcomp = orderfields(file.openrocket.rocket.subcomponents.stage.subcomponents);

%nose cone 
nosecone = subcomp.nosecone;

n1 = componentReader(nosecone);

totalLength = totalLength + str2num(nosecone.length.Text);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%nose cone components

try 
     nosecone_subcomponents = nosecone.subcomponents;

try
    bulkhead = nosecone_subcomponents.tubecoupler.subcomponents; % look for bulkhead
    b = componentReader(bulkhead)
catch
    pass;
end 

if exist('nosecone_subcomponents','var')
    
    fields = fieldnames(nosecone_subcomponents);
    
    for i = 1:length(fields)
    
        a = componentReader(nosecone_subcomponents.(fields{i}));
        disp(a)
        
    end 
    
end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%% Body of rocket





