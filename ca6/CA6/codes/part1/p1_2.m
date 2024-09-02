clc;
close all;
clear;

fs = 100;
fc = 5;
c = 300000000;
p = 2 / c;
v = 180 * (1000 / 3600);
r = 250000;
beta = 0.3;
alpha = 0.5;
t = 0:1/fs:1-(1/fs);
fd = beta * v;
td = p * r;
y = alpha * cos(2*pi*(fc+fd)*(t-td));

plot (t, y);