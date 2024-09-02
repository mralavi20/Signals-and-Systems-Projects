clc;
clear;
close all;

[file, path] = uigetfile ({'*.jpg;*.bmp;*.png;*.tif'}, 'Choose an image');
picture = imread ([path, file]);
picture = imresize (picture, [42, 24]);

picture = rgb2gray (picture);

threshold = graythresh (picture);
picture = ~imbinarize (picture, threshold);

picture = bwareaopen (picture, 200);

imwrite (picture, "image.BMP");