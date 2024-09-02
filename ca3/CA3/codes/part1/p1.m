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

image = imread ('IC.png');
image = rgb2gray (image);


image2 = coding (message, image, mapset);

subplot (1, 2, 1)
imshow (image)
subplot (1, 2, 2)
imshow (image2)

message2 = decoding (image2, mapset);

disp (message2);