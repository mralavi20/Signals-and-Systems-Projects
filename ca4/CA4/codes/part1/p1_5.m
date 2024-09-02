clc;
clear;
close all;

x = randn(1,3000);
histogram(x)

s = sum (x);
avg = s / 3000;

s2 = 0;
for i = 1:3000
    s2 = s2 + (x(i)- avg) ^ 2;
end

var = s2 / 3000;

disp (avg);
disp (var);
