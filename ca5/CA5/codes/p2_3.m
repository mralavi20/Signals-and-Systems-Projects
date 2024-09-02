clc;
clear;
close all;

m = 'signal';

speed = 1;
y = coding_freq(m, speed);
x = linspace(0,5*strlength(m)/speed,5*strlength(m)/speed*100);
figure
plot(x,y);


speed = 5;
y = coding_freq(m, speed);
x = linspace(0,5*strlength(m)/speed,5*strlength(m)/speed*100);
figure
plot(x,y);