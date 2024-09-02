clc;
close all;
clear;

fc = 5;
fs = 100;
t = 0:1/fs:1;
x = cos (2*pi*fc*t);

plot (t, x);