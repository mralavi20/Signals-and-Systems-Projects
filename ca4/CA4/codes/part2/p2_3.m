clc;
close all;
clear;


ts = 1e-9;
t = 0:ts:1e-5;
x1 = zeros(size(t));
t_size = length (t);
n = round (t_size / 10);
x1(1:n) = ones(1,n);
figure
plot(x1)


x2 = zeros(size(t));
x2(3001:3001+n-1) = 0.5*ones(1,n);
x2 = x2 + 5 * rand (size (x2));
figure
plot(x2)



y = conv(x1,x2);
figure
plot(y)

c=3e8;
[val ,pos] = max(y);
td = round((pos-1000))*1e-9;
r = c*td/2;
disp (r);