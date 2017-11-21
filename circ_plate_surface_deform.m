function [deform] = cir_plate_surface_deform(radius, rres, height, elasticity, modulus, load)
    % finds the deformation of a circular plate at (x,y )with a distributed load
    
    r = linspace(0,radius,rres);
    
    deform = r;
    
    D = elasticity*height^3/(12*(1-modulus^2));
    r_count=0;
    
    for i = 0
        r_count = r_count +1;
        deform(r_count) = load*(radius^2+rr^2)/(64*D)*((5+modulus)/(1+modulus)*(radius^2-rr^2));
    end
end