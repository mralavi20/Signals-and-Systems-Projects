clc;
clear;
close all;

mapset = cell (2, 32);

characters = 'abcdefghijklmnopqrstuvmxyz ,;?.!';
message = 'signal;';

for i = 1:32
    mapset{1, i} = characters(i);
    mapset{2, i} = dec2bin (i - 1, 5);
end

