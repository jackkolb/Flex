function [ deformation_vector, polar_deformation_matrix ] = circ_plate_point_deform( radius, rres, tres, height, load, poiss, modu )
% calculates the deformation of a rectangular plate (load at point x, y)
%   returns a matrix of the deformations across the plate surface

    r = linspace(0, radius, rres);
  
    deformation_vector = r;
    
    D = (modu*height^3) / (12 * (1-poiss^2));
    base_deform = load / (16*pi*D);
   
    % set deformation_vector
    r_count = 0;
    for rr = r
        r_count = r_count + 1;
        deformation_vector(r_count) = base_deform * ( (3+poiss)/(1+poiss)*(radius^2) - rr^2);   
    end
    
    % set polar_deformation_matrix
    polar_deformation_matrix = zeros([rres, tres]);
    for rr = 1:rres
        for th = 1:tres
            polar_deformation_matrix(rr, th) = deformation_vector(rr);
        end
    end
    

end

