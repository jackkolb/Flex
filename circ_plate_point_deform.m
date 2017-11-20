function [ deformation ] = circ_plate_point_deform( radius, rres, height, load, poiss, modu )
% calculates the deformation of a rectangular plate (load at point x, y)
%   returns a matrix of the deformations across the plate surface

    r = linspace(0, radius, rres);
  
    deformation = r;
    
    D = (modu*height^3) / (12 * (1-poiss^2));
    base_deform = load / (16*pi*D);
   
    r_count = 0;
    for rr = r
        r_count = r_count + 1;
        deformation(r_count) = base_deform * ( (3+poiss)/(1+poiss)*(radius^2) - rr^2);   
    end
    
%    deformation = (4*load)/(pi^2*width*length*D) * sum( sum( sin(m*pi*x0/width)*sin(n*pi*y0/length) / (m^2/width^2+n^2/length^2) * sin(m*pi*x/width)*sin(n*pi*y/length), n), m); % some random text

end

