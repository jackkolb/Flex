width = 30;
length = 30;
wres = 100;
lres = 100;

height = .25;
load = 30000;
x0 = 25;
y0 = 15;
poiss = .3;
modu = 30000000;

deform = rect_plate_point_deform(width, length, wres, lres, height, load, x0, y0, poiss, modu);
[X, Y] = meshgrid(linspace(0, width, wres), linspace(0, length, lres));

surf(X, Y, deform);