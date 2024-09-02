clc;
close all;
clear;

m = 'signal';

for i = 0:0.1:1
    disp (i);
    speed = 1;
    y = coding_freq(m,speed);
    y = y + i * rand (size (y));
    m2 = decoding_freq(y,speed);
    x = linspace(0,5*length(m)/speed,5*length(m)/speed*100);
    disp (m2);

    speed = 5;
    y = coding_freq(m,speed);
    y = y + i * rand (size (y));
    m2 = decoding_freq(y,speed);
    x = linspace(0,5*length(m)/speed,5*length(m)/speed*100);
    disp (m2);
end