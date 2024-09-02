clc;
close all;
clear;

c = 300000000;
p = 2 / c;
beta = 0.3;
alpha1 = 0.5;
v1 = 180 / 3.6;
r1 = 250000;
alpha2 = 0.6;
v2 = 216 / 3.6;
r2 = 200000;
fc = 5;
fs = 100;
fd1 = beta * v1;
fd2 = beta * v2;
td1 = p * r1;
td2 = p * r2;
t = 0:1/fs:1-1/fs;
y = alpha1 * cos(2*pi*(fc+fd1)*(t-td1)) + alpha2 * cos(2*pi*(fc+fd2)*(t-td2));

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

theta = angle (y2);

[m, index] = findpeaks (abs (y2));

f_new = abs (f(index(1)));
fd2 = f_new - fc;
theta = angle (y2(index(1)));
td2 = theta / (2 * pi * f_new);
v1_new = (fd2 / beta) * 3.6;
r1_new = (td2 / p) / 1000;

f_new = abs (f(index(2)));
fd2 = f_new - fc;
theta = angle (y2(index(2)));
td2 = theta / (2 * pi * f_new);
v2_new = (fd2 / beta) * 3.6;
r2_new = (td2 / p) / 1000;

disp (v1_new);
disp (r1_new);
disp (v2_new);
disp (r2_new);