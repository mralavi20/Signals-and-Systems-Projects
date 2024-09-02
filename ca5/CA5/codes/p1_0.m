clc;
clear;
close all;

fs = 20;
ts = 1/fs;

t = 0:ts:1 - ts;
x1 = exp (1i*2*pi*5*t) + exp (1i*2*pi*8*t);
x2 = exp (1i*2*pi*5*t) + exp (1i*2*pi*5.1*t);

figure
plot (t, x1)

figure
plot (t, x2)

y1 = fftshift(fft(x1));
y2 = fftshift(fft(x2));

y1_2 = y1 / max (abs (y1));
y2_2 = y2 / max (abs (y2));

n = length (y1);

f = -fs/2:fs/n:fs/2 - fs/n;

figure
plot (f, y1_2)

figure
plot (f, y2_2)