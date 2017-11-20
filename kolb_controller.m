width = 30;
length = 30;
wres = 100;
lres = 100;

height = .25;
load = 30000;
x0 = 5;
y0 = 20;
poiss = .3;
modu = 30000000;

subplot(3, 1, 1);
deform = rect_plate_point_deform(width, length, wres, lres, height, load, x0, y0, poiss, modu);
[X, Y] = meshgrid(linspace(0, width, wres), linspace(0, length, lres));
surf(X, Y, deform);

subplot(3, 1, 2);
deform = rect_plate_surface_deform(width, length, wres, lres, height, load, poiss, modu);
[X, Y] = meshgrid(linspace(0, width, wres), linspace(0, length, lres));
surf(X, Y, deform);

subplot(3, 1, 3);

radius = 30;

rres = 50;
tres = 25;

[deform_vector, deform_matrix] = circ_plate_point_deform(radius, rres, tres, height, load, poiss, modu);

[TH,R] = meshgrid(linspace(0,2*pi,tres), linspace(0,radius,rres));
[x,y,z] = pol2cart(TH,R,deform_matrix);
surf(x,y,z);