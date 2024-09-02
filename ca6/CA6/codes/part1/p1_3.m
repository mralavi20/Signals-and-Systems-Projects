clc;
close all;
clear;

fs = 100;
fc = 5;
c = 300000000;
p = 2 / c;
v = 180 / 3.6;
r = 250000;
beta = 0.3;
alpha = 0.5;
ts = 1 / fs;
t = 0:ts:1-ts;
fd = beta * v;
td = p * r;
y = alpha * cos(2*pi*(fc+fd)*(t-td));

y2 = fftshift(fft(y));

l = length(y2);
f = (-l/2:l/2-1)/l*fs;

tol = 1e-6;
y2(abs(y2) < tol) = 0;

figure
plot(f,abs(y2))

theta = angle (y2);

figure
plot (f,theta/pi)

[m, index] = max (y2);
f_new = abs (f(index));
fd2 = f_new - fc;
theta = angle (y2(index));
td2 = theta / (2 * pi * f_new);
r2 = (td2 / p) / 1000;
v2 = (fd2 / beta) * 3.6;

disp (v2);
disp (r2);