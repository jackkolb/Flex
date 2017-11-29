%plate_deformation('circ', {'load type', load, x0 (if applicable), y0 (if applicable)}, '3d', width, length, wres, lres, height, poiss, modu);
% Test Case 1
subplot(3,5,1)
plate_deformation('rect', {'point', 30000, 15, 15}, '3d', 30, 30, 100, 100, 0.25, 0.3, 30.0*10^6);

% Test Case 2
subplot(3,5,2)
plate_deformation('rect', {'point', 3000, 5, 15}, 'contour', 30, 30, 100, 100, 0.25, 0.3, 30.0*10^6);

% Test Case 3
subplot(3,5,3)
plate_deformation('rect', {'point', 1500, 0.025, 0.025}, '3d', 0.15, 0.1, 100, 100, 0.002, 0.334, 70.0*10^9);

% Test Case 4
subplot(3,5,4)
plate_deformation('rect', {'surface', 200}, '3d', 8, 20, 100, 100, 0.25, 0.3, 30.0*10^6);

% Test Case 5
subplot(3,5,5)
plate_deformation('rect', {'surface', 200}, 'contour', 20, 20, 100, 100, 0.25, 0.3, 30.0*10^6);

% Test Case 6
subplot(3,5,6)
plate_deformation('rect', {'point',120, 5, 10; 'surface', 80, 0, 0}, 'contour', 10, 20, 100, 100, 0.125, 0.3, 10.0*10^6);

% Test Case 7
subplot(3,5,7)
plate_deformation('rect', {'surface', 40, 0, 0; 'point', 120, 2, 10}, 'contour', 10, 20, 100, 100, 0.125, 0.3, 10.0*10^6);

% Test Case 8
subplot(3,5,8)
plate_deformation('circ', {'point', 2500}, '2d', 12, 12, 100, 100, 0.25, 0.3, 30.0*10^6);

% Test Case 9
subplot(3,5,9)
plate_deformation('circ', {'point', 2500}, '2d', 12, 12, 100, 100, 0.25, 0.3, 30.0*10^6);

% Test Case 10
subplot(3,5,10)
plate_deformation('circ', {'point', 2000}, '2d', 0.05, 0.05, 100, 100, 0.002, 0.334, 70.0*10^9);

% Test Case 11
subplot(3,5,11)
plate_deformation('circ', {'surface', 150}, '3d', 4, 4, 100, 100, 0.25, 0.3, 30.0*10^6);

% Test Case 12
subplot(3,5,12)
plate_deformation('circ', {'surface', 150}, 'contour', 10, 10, 100, 100, 0.25, 0.3, 30.0*10^6);

% Test Case 13
subplot(3,5,13)
plate_deformation('circ', {'surface', 80; 'point', 120}, 'contour', 5, 5, 100, 100, 0.125, 0.3, 10.0*10^6);

% Test Case 14
subplot(3,5,14)
plate_deformation('circ', {'surface', 40; 'point', 120}, 'contour', 5, 5, 100, 100, 0.125, 0.3, 10.0*10^6);