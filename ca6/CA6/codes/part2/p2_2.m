clc;
close all;
clear;

keys = ["d" "d" "e" "d" "g" "f2" "d" "d" "e" "d" "a" "g" "d" "d" "b" "g" "f2" "e" "c" "c" "b" "g" "a" "g"];
tends = [0.25 0.25 0.5 0.5 0.5 0.5 0.25 0.25 0.5 0.5 0.5 0.5 0.25 0.25 0.5 0.5 0.5 0.5 0.25 0.25 0.5 0.5 0.5 0.5];

tstart = 0;
fs = 8000;
ts = 1 / fs;
d = zeros (1, 200);
w = [];

for i = 1:24
    key = keys(i);
    tend = tends(i);
    f = find_frequency (key);
    t = tstart:ts:tend - ts;
    y = sin(2*pi*f*t);
    w = [w y];
    w = [w d];
end

sound (w, fs);

audiowrite ("mysong.wav", w, fs);

disp (audioinfo ("mysong.wav"));