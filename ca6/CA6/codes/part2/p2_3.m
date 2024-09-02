clc;
close all;
clear;

[y, fs] = audioread ("audio.wav");

fs2 = 8000;
ts = 1/fs2;
tstart = 0;
tend = 0.25;
t = tstart:ts:tend - ts;

d = ones (1, 200);

s = size (y);
corrs = [];
for i = 1:s - 200
    c = dot (y(i:i+200-1), d);
    corrs = [corrs c];
end

pos = find (corrs == 0);
n = length (pos);

h = [];
a = (pos(1) - 1) / 8000;
h = [h a];

for i = 1:n / 2 - 1
    a = (pos(2*i+1) - pos(2*i-1) - 200) / 8000;
    h = [h a];
end

x = {};

x{1} = sin(2*pi*523.25*t);
x{2} = sin(2*pi*554.37*t);
x{3} = sin(2*pi*587.33*t);
x{4} = sin(2*pi*622.25*t);
x{5} = sin(2*pi*659.25*t);
x{6} = sin(2*pi*698.46*t);
x{7} = sin(2*pi*739.9*t);
x{8} = sin(2*pi*783.99*t);
x{9} = sin(2*pi*830.61*t);
x{10} = sin(2*pi*880*t);
x{11} = sin(2*pi*932.33*t);
x{12} = sin(2*pi*987.77*t);

n2 = length (h);
index = 1;
for i = 1:n2
    a = y(index:index + 2000 - 1);
    
    for j = 1:12
        corrs2(j) = dot (a, x{j});
    end
    
    [~, p(i)] = max (corrs2);
    index = index + h(i)*8000 + 200;
end

notes = ["c", "c#" , "d" , "d2" , "e" , "f" , "f2" , "g" , "g2" , "a" , "a2" , "b"];

n3 = length (p);

for i = 1:n3
    r(i) = notes(p(i));
end

disp (r);
disp (h);