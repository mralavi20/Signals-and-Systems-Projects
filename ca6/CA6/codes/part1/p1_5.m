clc;
close all;
clear;

c = 300000000;
p = 2 / c;
beta = 0.3;
alpha1 = 0.5;
v1 = 180 * (1000 / 3600);
r1 = 250000;
alpha2 = 0.6;
v2 = 216 * (1000 / 3600);
r2 = 200000;
fc = 5;
fs = 100;
fd1 = beta * v1;
fd2 = beta * v2;
td1 = p * r1;
td2 = p * r2;
t = 0:1/fs:1-1/fs;
y = alpha1 * cos(2*pi*(fc+fd1)*(t-td1)) + alpha2 * cos(2*pi*(fc+fd2)*(t-td2));

plot (t, y);