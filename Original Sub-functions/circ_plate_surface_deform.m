function [ deform, polar_deformation_matrix ] = circ_plate_surface_deform(radius, rres, tres, height, elasticity, modulus, load)
    % finds the deformation of a circular plate at (x,y )with a distributed load
    
    r = linspace(0,radius,rres);
    
    deform = r;
    
    D = elasticity*height^3/(12*(1-modulus^2));
    r_count=0;
    
    % set deformation_vector
    for rr = r
        r_count = r_count +1;
        deform(r_count) = load*(radius^2-rr^2)/(64*D)*((5+modulus)/(1+modulus)*(radius^2) - rr^2);
    end
    
    % set polar_deformation_matrix
    polar_deformation_matrix = zeros([rres, tres]);
    for rr = 1:rres
        for th = 1:tres
            polar_deformation_matrix(rr, th) = deform(rr);
        end
    end
    
end