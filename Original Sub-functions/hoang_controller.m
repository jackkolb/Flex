%plate_deformation('circ', {'load type', load, x0 (if applicable), y0 (if applicable)}, '3d', width, length, wres, lres, height, poiss, modu);
% Test Case 1
plate_deformation('rect', {'point', 30000, 15, 15}, '3d', 30, 30, 100, 100, 0.25, 0.3, 30.0*10^6);

