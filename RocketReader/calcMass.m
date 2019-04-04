function mass = calcMass(component,name)
        
    if name == 'TUBE COUPLER'
        
        d = 1000 * str2num(component.material.Attributes.density); % density    
        r1 = str2num(component.outerradius.Text);     
        r2 = str2num(component.outerradius.Text) - str2num(component.thickness.Text);
        h = str2num(component.length.Text);
        mass = d * (pi*h*(r1^2 - r2^2));
        
    end 
        
end 