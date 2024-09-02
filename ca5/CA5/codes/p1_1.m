clc;
clear;
close all;

fs = 50;
ts  = 1/fs;

t = -1:ts:1 - ts;

x1 = cos(10*pi*t);

figure
plot (t, x1)

y1 = fftshift(fft(x1));
y1_p = y1 / max (abs(y1));

n = length (y1);
f = -fs/2:fs/n:fs/2 - fs/n;

figure
plot (f, y1_p)
