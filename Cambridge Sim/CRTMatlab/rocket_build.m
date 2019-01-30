function rocket_build()
stop = false;
while stop == false
    clc;
    disp(sprintf('//******************************************//'));
    disp(sprintf('//******************************************//'));
    disp(sprintf('\n\n***ROCKET BUILD PARAMETERS***'));
    disp(sprintf('\n\nCHOOSE WHICH COMPONENT TO ENTER'));
    disp(sprintf('1. Nose Cone '));
    disp(sprintf('2. Cylinders'));
    disp(sprintf('3. Tubes'));
    disp(sprintf('4. Conical Transitions'));
    disp(sprintf('5. Point Masses'));
    disp(sprintf('6. Parachutes'));
    disp(sprintf('7. Fin Sets'));
    disp(sprintf('8. Motor Info'));
    disp(sprintf('9. Exit the Menu'));
    
    disp(sprintf('\nPlease enter the number from the menu for the component you would like to enter, then press enter'));

    MMs = input(':>','s');
    MM = str2num(MMs);
    MM = uint8(MM);
    
    if (~isempty(MM) && MM>=1 && MM<=8)
        stop = true;
    else
        disp(sprintf(['!! Sorry ',MMs,' is not a recognised menu item please try again']));
    end 
    %% Check for end condition
    if MM == 9
        clc;
        stop = true;
    end
    %% Component Reader
    cyl_num = 1;
    tube_num = 1;
    if MM == 1 % Nose Cone
        disp(sprintf('\nPlease enter nose cone style. (Ex. "ogdive")'));
        nose_style = input(':>','s');
        disp(sprintf('\nPlease enter the length of the nose cone (m). '));
        nose_length = input(':>','s');
        nose_length = str2num(nose_length);
        disp(sprintf('\nPlease enter the diameter at the base (m). '));
        nose_dia = input(':>','s');
        nose_dia = str2num(nose_dia);
        disp(sprintf('\nPlease enter mass of the nose cone (kg). '));
        nose_m = input(':>','s');
        nose_m = str2num(nose_m);   
        
        % set cell array for building 
        n1 = {'nose',nose_style,nose_length,nose_dia,nose_m,0};
    elseif MM == 2 % Cylinders 
        disp(sprintf("\nPlease enter yes if the cylinder has a surface that forms part of the rocket's outter surface."))
        disp(sprintf("Enter no if it is an internal cylinder"));
        outter_surface = input(':>','s');
        disp(sprintf("Enter the length of the cylinder"));
        cyl_len = input(':>','s');
        cyl_len = str2num(cyl_len);
        disp(sprintf("Enter the diameter of the cylinder"));
        cyl_dia = input(':>','s');
        cyl_dia = str2num(cyl_dia);
        disp(sprintf("Enter the mass of the cylinder"));
        cyl_mass = input(':>','s');
        cyl_mass = str2num(cyl_mass);
        disp(sprintf("Enter the position of the cylinder measured from the tip of the nose cone to the foremost part of the cylinder"));
        cyl_pos = input(':>','s');
        cyl_pos = str2num(cyl_pos);
        c1 = {'cylinder',outter_surface,cyl_len,cyl_dia,cyl_mass,cyl_pos};
    end 
    
end
end 