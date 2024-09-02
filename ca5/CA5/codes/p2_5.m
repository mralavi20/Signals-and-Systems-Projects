clc;
close all;
clear;

m = 'signal';

noise = 0.01;

speed = 1;
y = coding_freq(m,speed);
y = y + noise * rand (size (y));
m2 = decoding_freq(y,speed);
x = linspace(0,5*length(m)/speed,5*length(m)/speed*100);
disp (m2);
figure
plot (x, y)

speed = 5;
y = coding_freq(m,speed);
y = y + noise * rand (size (y));
m2 = decoding_freq(y,speed);
x = linspace(0,5*length(m)/speed,5*length(m)/speed*100);
disp (m2);
figure
plot (x, y)