clc;
close all;
clear;

keys = ["d" "d" "g" "f2" "d" "d" "e" "e" "d" "f2" "d" "e" "d" "e" "f2" "e" "d" "e" "e" "d" "f2" "d" "e" "d" "e" "d" "f2" "e" "d" "e" "d" "f2" "e" "d" "d" "e" "f2" "e" "f2" "f2" "e" "f2" "f2" "d"];
tends = [0.25 0.25 0.5 0.5 0.5 0.25 0.25 0.25 0.25 0.25 0.25 0.5 0.5 0.5 0.5 0.5 0.25 0.25 0.25 0.25 0.25 0.25 0.5 0.5 0.25 0.25 0.5 0.5 0.5 0.25 0.25 0.5 0.5 0.25 0.25 0.5 0.25 0.25 0.5 0.25 0.25 0.5 0.5 0.5 ];

tstart = 0;
fs = 8000;
ts = 1 / fs;
d = zeros (1, 200);
w = [];

for i = 1:44
    key = keys(i);
    tend = tends(i);
    f = find_frequency (key);
    t = tstart:ts:tend - ts;
    y = sin(2*pi*f*t);
    w = [w y];
    w = [w d];
end

sound (w, fs);

audiowrite ("audio.wav", w, fs);