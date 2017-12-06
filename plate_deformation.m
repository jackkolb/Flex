function [ max_val ] = plate_deformation( shape, loads, plot_type, x, y, xres, yres, height, poisson, modulus, main_axes )
% Controller function for the plate deformations
% Input loads as a n by 2 matrix, of type and load
% ex: ['point', 50; 'point', 100; 'surface', 82]

% ::catch errors::
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
sz = size(loads);
for rr=1:sz(1)
    % get load data from load matrix row
    load_type = loads{rr, 1};
    load = loads{rr, 2};
    
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
        % if load is a point load...
        if strcmp(load_type, 'point')
            x0 = loads{rr, 3};
            y0 = loads{rr, 4};
            def_mat = rect_plate_point_deform(x, y, xres, yres, height, load, x0, y0, poisson, modulus);
        % if load is a surface load...
        elseif strcmp(load_type, 'surface')
            def_mat = rect_plate_surface_deform(x, y, xres, yres, height, load, poisson, modulus);
        end
        % Add the calculated deflection matrix to the total deflection
        % matrix
        Z = def_mat;
        [X, Y] = meshgrid(linspace(0, x, xres), linspace(0, y, yres));
        total_deflection_matrix = total_deflection_matrix + Z;

    case 'circ'
        % if load is a point load...
        if strcmp(load_type, 'point')
            [def_vec, def_mat] = circ_plate_point_deform(x, xres, yres, height, load, poisson, modulus);
        % if load is a surface load...
        elseif strcmp(load_type, 'surface')
            [def_vec, def_mat] = circ_plate_surface_deform(x, xres, yres, height, load, poisson, modulus);
        end
        % Add the calculated deflection matrix to the total deflection
        % matrix
        [TH,R] = meshgrid(linspace(0,2*pi,yres), linspace(0,x,xres));
        [X,Y,Z] = pol2cart(TH,R,def_mat);
        total_deflection_matrix = total_deflection_matrix + Z;
end
end

% plot the deflection matrix
if strcmp(plot_type, '2d') && strcmp(shape, 'circ')
    plot(linspace(0, x, xres), def_vec, 'parent', main_axes);
elseif strcmp(plot_type, 'contour') || strcmp(plot_type, '2d')
    contour(Z, 'parent', main_axes);
elseif strcmp(plot_type, '3d')
    surf(X, Y, Z, 'parent', main_axes);
end

% set the max deflection (which will be returned)
max_val = max(Z(:));
end

function [ deformation ] = rect_plate_point_deform( width, length, wres, lres, height, load, x0, y0, poiss, modu )
% calculates the deformation of a rectangular plate (load at point x, y)
%   returns a matrix of the deformations across the plate surface

    % set x and y vectors
    x = linspace(0, width, wres);
    y = linspace(0, length, lres);
  
    % set deformation matrix to zeroes
    deformation = zeros([lres wres]);
    
    % calculate base values (D, base_deform)
    D = (modu*height^3) / (12 * (1-poiss^2));
    base_deform = (4*load)/(pi^4*width*length*D);
    
    % m and n are vectors used through summation in the deformation
    % calculations
    m = 1:10;
    n = 1:10;
    
    % iterate through x and y, calculating the deflection at that point,
    % placing the deformation into its corresponding slot in the
    % deformation matrix
    x_count = 0;
    for xx = x
        x_count = x_count + 1;
        y_count = 0;
        for yy = y
            y_count = y_count + 1;
            
            sum_deform = 0;
            for mm = m
               for nn = n
                   sum_deform = sum_deform + sin(mm*pi*x0/width)*sin(nn*pi*y0/length) / (mm^2/width^2+nn^2/length^2)^2 * sin(mm*pi*xx/width)*sin(nn*pi*yy/length);
               end
            end
            
            deformation(y_count, x_count) = base_deform * sum_deform;
        end    
    end
    
end

function [ deformation ] = rect_plate_surface_deform( width, length, wres, lres, height, load, poiss, modu )
% calculates the deformation of a rectangular plate (load over surface)

    % set x and y vectors
    x = linspace(0, width, wres);
    y = linspace(0, length, lres);
  
    % set deformation matrix to zeros
    deformation = zeros([lres wres]);
    
    % calculate base constants (D, base_deform)
    D = (modu*height^3) / (12 * (1-poiss^2));
    base_deform = (16*load)/(pi^6*D);
    
    % m and n are described as odd in this case
    m = 1:2:11;
    n = 1:2:11;
    
    % iterate through x and y, calculating the deflection at that point,
    % placing the deformation into its corresponding slot in the
    % deformation matrix
    x_count = 0;
    for xx = x
        x_count = x_count + 1;
        y_count = 0;
        for yy = y
            y_count = y_count + 1;
            
            sum_deform = 0;
            for mm = m
               for nn = n
                   sum_deform = sum_deform + sin(mm*pi*xx/width)*sin(nn*pi*yy/length) / (mm*nn*(mm^2/width^2+nn^2/length^2)^2);
               end
            end
            deformation(y_count, x_count) = base_deform * sum_deform;
        end    
    end

end

function [ deformation_vector, polar_deformation_matrix ] = circ_plate_point_deform( radius, rres, tres, height, load, poiss, modu )
% calculates the deformation of a rectangular plate (load at point x, y)
%   returns a matrix of the deformations across the plate surface

    % set radius vector
    r = linspace(0, radius, rres);
  
    % set deformation vector initially to r (values will change)
    deformation_vector = r;
    
    % calculate base constants (D, base_deform)
    D = (modu*height^3) / (12 * (1-poiss^2));
    base_deform = load / (16*pi*D);
   
    % iterate through r, calculating the deflection at that radius,
    % placing the deformation into its corresponding slot in the
    % deformation vector
    r_count = 0;
    for rr = r
        r_count = r_count + 1;
        deformation_vector(r_count) = base_deform * ( (3+poiss)/(1+poiss)*(radius^2 - rr^2) + 2 * rr ^ 2 * log(rr/radius));   
    end
    
    % remap the deformation vector (r) into a polar deformation matrix 
    % (r, t)
    polar_deformation_matrix = zeros([rres, tres]);
    for rr = 1:rres
        for th = 1:tres
            polar_deformation_matrix(rr, th) = deformation_vector(rr);
        end
    end
end

function [ deform, polar_deformation_matrix ] = circ_plate_surface_deform(radius, rres, tres, height, elasticity, modulus, load)
    % finds the deformation of a circular plate with a distributed load
    
    % set radius vector
    r = linspace(0,radius,rres);
    
    % set deformation vector initially to r (values will change)
    deform = r;
    
    % calculate base constants (D, base_deform) 
    D = elasticity*height^3/(12*(1-modulus^2));
    r_count=0;
    
    % iterate through r, calculating the deflection at that radius,
    % placing the deformation into its corresponding slot in the
    % deformation vector
    for rr = r
        r_count = r_count +1;
        deform(r_count) = load*(radius^2-rr^2)/(64*D)*((5+modulus)/(1+modulus)*(radius^2) - rr^2);
    end
 
    % remap the deformation vector (r) into a polar deformation matrix 
    % (r, t)
    polar_deformation_matrix = zeros([rres, tres]);
    for rr = 1:rres
        for th = 1:tres
            polar_deformation_matrix(rr, th) = deform(rr);
        end
    end  
end
