clc;
close all;
clear;

ts = 1e-9;
t = 0:ts:1e-5;
x = zeros(size(t));
t_size = length (t);
n = round (t_size / 10);
x(1:n) = ones(1,n);
figure
plot (t, x)


x2 = zeros(size(t));
x2(3001:3001+n-1) = 0.5*ones(1,n);
figure
plot (t, x2)