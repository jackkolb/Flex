function [ ] = plate_deformation( shape, load_type, plot_type, x, y, xres, yres, height, load, poiss, modulus )
% Controller function for the plate deformations

switch(shape)
    
    case 'rect'
        if strcmp(load_type, 'point')
            def_mat = rect_plate_point_deform(x, y, xres, yres, height, load, x/2, y/2, poiss, modulus);
        elseif strcmp(load_type, 'surface')
            def_mat = rect_plate_surface_deform(x, y, xres, yres, height, load, poiss, modulus);
        end
        Z = def_mat;
        [X, Y] = meshgrid(linspace(0, x, xres), linspace(0, y, yres));

        if strcmp(plot_type, '2d')
            contour(Z);
        elseif strcmp(plot_type, '3d')
            surf(X, Y, Z);
        end

    case 'circ'
        if strcmp(load_type, 'point')
            [def_vec, def_mat] = circ_plate_point_deform(x, xres, yres, height, load, poiss, modulus);
        elseif strcmp(load_type, 'surface')
            [def_vec, def_mat] = circ_plate_surface_deform(x, xres, yres, height, load, poiss, modulus);
        end
        [TH,R] = meshgrid(linspace(0,2*pi,yres), linspace(0,x,xres));
        [X,Y,Z] = pol2cart(TH,R,def_mat);
        
        if strcmp(plot_type, '2d')
            plot(linspace(0, x, xres), def_vec);
        elseif strcmp(plot_type, '3d')
            surf(X, Y, Z);
        end
end


end
