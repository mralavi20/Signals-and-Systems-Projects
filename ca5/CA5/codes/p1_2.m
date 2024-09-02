clc;
clear;
close all;

fs = 100;
ts = 1 / fs;

t = 0:ts:1 - ts;
x2 = cos(30*pi*t+pi/4);
figure
plot (t, x2)

y2 = fftshift(fft(x2));
y2_p = y2 / max (abs(y2));

n = length (y2);
f = -fs/2:fs/n:fs/2 - fs/n;

figure
plot (f, y2_p)

tol = 1e-6;
y2(abs(y2) < tol) = 0;
theta = angle(y2);
figure
plot(f,theta/pi)
xlabel 'Frequency (Hz)'
ylabel 'Phase / \pi'