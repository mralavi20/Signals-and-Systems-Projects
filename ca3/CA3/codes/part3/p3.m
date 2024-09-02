clc;
close all;
clear;

image1 = imread ('PCB.jpg');
image2 = imread ('IC.png');

image1_gray = rgb2gray (image1);
image2 = rgb2gray (image2);

image3 = imrotate (image2, 180);


result1 = corr1 (image1_gray, image2);
result2 = corr1 (image1_gray, image3);

[r, c, a] = size (image2);

imshow (image1)
hold on;
[rows, cols] = find (result1 > 0.9);
for i = 1:length (rows)
    rectangle ('Position', [cols(i) rows(i) c r], 'Edgecolor', 'b')
end

[rows, cols] = find (result2 > 0.9);
for i = 1:length (rows)
    rectangle ('Position', [cols(i) rows(i) c r], 'Edgecolor', 'b')
end