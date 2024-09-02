clc;
close all;
clear;

m = 'signal';

speed = 1;
y = coding_freq(m,speed);
m2 = decoding_freq(y,speed);
x = linspace(0,5*strlength(m)/speed,5*strlength(m)/speed*100);
disp (m2);

speed = 5;
y = coding_freq(m,speed);
m2 = decoding_freq(y,speed);
x = linspace(0,5*strlength(m)/speed,5*strlength(m)/speed*100);
disp (m2);