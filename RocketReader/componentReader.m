function output = componentReader(component)

    if strcmp(upper(component.name.Text),'NOSE CONE')
        
        output = {'nose',component.shape.Text,str2num(component.length.Text),2*str2num(component.aftradius.Text),str2num(component.overridemass.Text),0};

    elseif strcmp(upper(component.name.Text),'TUBE COUPLER')
        
        mass = calcMass(component,upper(component.name.Text));
 
        output = {'tube',str2num(component.length.Text),str2num(component.outerradius.Text)-str2num(component.thickness.Text),str2num(component.outerradius.Text),mass,str2num(component.length.Text)};
        
    elseif strcmp(upper(component.name.Text),'BLACK POWDER CHARGE')
        
        output = {'pm',str2num(component.mass.Text),str2num(component.radialposition.Text),str2num(component.position.Text)};
      
    elseif strcmp(upper(component.name.Text),'SHOCK CORD')
        
        output = {'pm',str2num(component.overridemass.Text),str2num(component.radialposition.Text),str2num(component.position.Text)};
      
    else
        output = 0;
    end 
    
    
end 