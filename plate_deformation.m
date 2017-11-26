function [ ] = plate_deformation( shape, loads, plot_type, x, y, xres, yres, height, poisson, modulus )
% Controller function for the plate deformations
% Input loads as a n by 2 matrix, of type and load
% ex: ['point', 50; 'point', 100; 'surface', 82]

% catch errors

% shape, load_type, or plot_type are invalid
shapes = ['circ', 'rect'];
plot_types = ['2d', 'contour', '3d'];
load_types = ['p', 's'];

if ~ismember(shapes, shape)
    error('plate_deformation:invalid_parameter', 'inputted shape is invalid (need circ or rect)');
elseif ~ismember(plot_types, plot_type)
    error('plate_deformation:invalid_parameter', 'inputted plot_type is invalid (need 2d, 3d, or contour)');
    
% x, y, xres, yres, or height <= 0; modulus, or poisson < 0 
elseif x <= 0
    error ('plate_deformation:invalid_parameter', 'inputted width is <= 0');
elseif y <= 0
    error ('plate_deformation:invalid_parameter', 'inputted length is <= 0');
elseif xres <= 0
    error ('plate_deformation:invalid_parameter', 'inputted width resolution is <= 0');
elseif yres <= 0
    error ('plate_deformation:invalid_parameter', 'inputted length resolution is <= 0');
elseif modulus < 0
    error ('plate_deformation:invalid_parameter', 'inputted modulus is <= 0');
elseif poisson < 0
    error ('plate_deformation:invalid_parameter', 'inputted poisson is <= 0');
end

% set initial matrix to zeros
total_deflection_matrix = zeros(xres, yres);

% for each load, add to the deflection matrix
for rr=1:size(loads)
    % get load data from load matrix row
    load_type = loads(rr, 1);
    load = loads(rr, 2);
    
    % check that load is valid
    if load < 0
        error ('plate_deformation:invalid_parameter', 'inputted load is < 0');
    elseif ~ismember(load_types, load_type)
        error ('plate_deformation:invalid_parameter', 'load type is invalid (need point or surface)');
    end

% calculate deflection matrix of this load, add to overall deflection
% matrix
switch(shape)
    case 'rect'
        if strcmp(load_type, 'p')
            x = loads(3);
            y = loads(4);
            def_mat = rect_plate_point_deform(x, y, xres, yres, height, load, x, y, poisson, modulus);
        elseif strcmp(load_type, 's')
            def_mat = rect_plate_surface_deform(x, y, xres, yres, height, load, poisson, modulus);
        end
        Z = def_mat;
        [X, Y] = meshgrid(linspace(0, x, xres), linspace(0, y, yres));
        total_deflection_matrix = total_deflection_matrix + Z;

    case 'circ'
        if strcmp(load_type, 'p')
            [def_vec, def_mat] = circ_plate_point_deform(x, xres, yres, height, load, poisson, modulus);
        elseif strcmp(load_type, 's')
            [def_vec, def_mat] = circ_plate_surface_deform(x, xres, yres, height, load, poisson, modulus);
        end
        [TH,R] = meshgrid(linspace(0,2*pi,yres), linspace(0,x,xres));
        [X,Y,Z] = pol2cart(TH,R,def_mat);
        total_deflection_matrix = total_deflection_matrix + Z;
end
end

% plot deflection matrix
if strcmp(plot_type, '2d') && strcmp(shape, 'circ')
    plot(linspace(0, x, xres), def_vec);
elseif strcmp(plot_type, 'contour') || strcmp(plot_type, '2d')
    contour(Z);
elseif strcmp(plot_type, '3d')
    surf(X, Y, Z);
end

% display max deflection
max_val = max(Z(:));
title({'Max Deflection: ', max_val});


end

