width = 30;
length = 30;
xres = 10;
yres = 10;

height = .125;
load = 30000;
x0 = 15;
y0 = 15;
poiss = .3;
modu = 30000000;

deform = rect_plate_point_deform(width, length, xres, yres, height, load, x0, y0, poiss, modu);
[X, Y] = meshgrid(linspace(0, width, xres), linspace(0, length, yres)); 
surf(X, Y, deform);