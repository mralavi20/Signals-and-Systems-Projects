clc;    
close all; 
clear;
message = 'signal';

speed = 1;

x = linspace (0,5*length(message)/speed,5*length(message)/speed*100+1);
y = coding_amp (message,speed);
figure
plot (x,y);



speed = 2;

x = linspace(0,5*length(message)/speed,5*length(message)/speed*100+1);
y = coding_amp (message,speed);
figure
plot (x,y);


speed = 3;

x = linspace (0,5*length(message)/speed,5*length(message)/speed*100+1);
y = coding_amp (message,speed);
figure
plot (x,y);
