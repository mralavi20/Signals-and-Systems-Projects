clc;
clearvars;

[x, fs] = audioread ("audio.wav");

ts = 6 / length (x);

t = 0:ts:6;

index = length (t);
t(index) = [];
t(index - 1) = 6;

plot (t, x);

sound (x, fs);

audiowrite ("x.wav", x, fs);