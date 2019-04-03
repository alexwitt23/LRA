filename = 'rocket2.ork';
file = xml2struct(filename);

%% Index of possible components
%{
nosecone

cylinders

tubes 
    motor tube
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
%%

%Subcomponents
subcomp = orderfields(file.openrocket.rocket.subcomponents.stage.subcomponents);

%nose cone 
nosecone = subcomp.nosecone;
n1 = {'nose',nosecone.shape.Text,str2num(nosecone.length.Text),2*str2num(nosecone.aftradius.Text),str2num(nosecone.overridemass.Text),0};