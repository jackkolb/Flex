function [ deformation ] = rect_plate_surface_deform( width, length, wres, lres, height, load, poiss, modu )
% calculates the deformation of a rectangular plate (load over surface)
%   Detailed explanation goes here

    x = linspace(0, width, wres);
    y = linspace(0, length, lres);
  
    deformation = zeros([lres wres]);
    
    D = (modu*height^3) / (12 * (1-poiss^2));
    base_deform = (16*load)/(pi^6*D);
    
    m = 1:10;
    n = 1:10;
    
    x_count = 0;
    for xx = x
        x_count = x_count + 1;
        y_count = 0;
        for yy = y
            y_count = y_count + 1;
            
            sum_deform = 0;
            for mm = m
               for nn = n
                   sum_deform = sum_deform + sin(mm*pi*x/width)*sin(nn*pi*y/length) / (mm*nn*(mm^2/width^2+nn^2/length^2)^2);
               end
            end
            
            deformation(y_count, x_count) = base_deform * sum_deform;
        end    
    end
    
%    deformation = (4*load)/(pi^2*width*length*D) * sum( sum( sin(m*pi*x0/width)*sin(n*pi*y0/length) / (m^2/width^2+n^2/length^2) * sin(m*pi*x/width)*sin(n*pi*y/length), n), m); % some random text


end

