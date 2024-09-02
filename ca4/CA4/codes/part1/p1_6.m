clc;
clear;
close all;

message = 'signal';


i = 0.1;


speed = 1;

x = linspace (0,5*length(message)/speed,5*length(message)/speed*100+1);
y = coding_amp (message,speed);
figure
plot (x, y)
y = y + (i * rand (size (y)));
figure
plot (x, y)
m = decoding_amp (y, speed)


speed = 2;

x = linspace (0,5*length(message)/speed,5*length(message)/speed*100+1);
y = coding_amp (message,speed);
figure
plot (x, y)
y = y + (i * rand (size (y)));
figure
plot (x, y)
m = decoding_amp (y, speed)


speed = 3;

x = linspace (0,5*length(message)/speed,5*length(message)/speed*100+1);
y = coding_amp (message,speed);
figure
plot (x, y)
y = y + (i * rand (size (y)));
figure
plot (x, y)
m = decoding_amp (y, speed)
