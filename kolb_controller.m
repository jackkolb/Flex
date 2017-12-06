width = 30;
length = 30;
wres = 100;
lres = 100;

height = .25;
load = 30000;
poiss = .3;
modu = 30000000;
plate_deformation('circ', {'point',load, 3, 5}, '3d', width, length, wres, lres, height, poiss, modu, axes);