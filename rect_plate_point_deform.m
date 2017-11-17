function [ deformation ] = rect_plate_point_deform( width, length, height, load, poisson, modulus )
% calculates the deformation of a rectangular plate (load at point x, y)
%   Detailed explanation goes here

    m = 1:inf;
    n = 1:inf;

    D = (modulus * height ^ 3) / (12 * (1-v)^2);
    deformation = @(x,y) (4*load)/(pi^2*width*length*D);

end

