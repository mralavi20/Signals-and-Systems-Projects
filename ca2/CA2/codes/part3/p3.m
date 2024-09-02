clc;
clear;
close all;

[file, path] = uigetfile ({'*.jpg;*.bmp;*.png;*.tif'}, 'Choose an image');
picture = imread ([path, file]);

b = picture(:,:,3) - rgb2gray(picture);

b = medfilt2(b);

b = imbinarize(b, 0.25);

b = bwareaopen(b, 50);

l = bwlabel(b);
stats = regionprops(l, 'BoundingBox', 'Centroid'); 
bound = stats(1).BoundingBox;
bound(4) = 2.2 * bound(3);
bound(2) = bound(2) - (bound(4) / 6);
bound(3) = bound(3) * 11;

picture = imcrop(picture,bound);

picture = imresize (picture, [300 500]);

picture = mygrayfun (picture);
picture = mybinaryfun (picture);
picture = myremovecom (picture, 300);
background = myremovecom (picture, 3000);
picture = picture - background;
[l, n] = mysegmentation (picture);

load TRAININGSET;
letters_num = size (TRAIN, 2);
final_result = [];

for i = 1:n
    [r, c] = find (l == i);
    y = picture (min (r):max(r), min (c):max(c));
    y = imresize (y, [42, 24]);
    
    corr_nums = zeros (1, letters_num);
    
    for j = 1:letters_num
        corr_nums(j) = corr2 (TRAIN{1, j}, y);
    end
    
    [max_corr, index] = max (corr_nums);
    
    
    result = cell2mat (TRAIN(2, index));
    final_result = [final_result result];
end

file = fopen ('number_Plate.txt', 'wt');
fprintf (file, '%s\n', final_result);
fclose (file);
winopen('number_Plate.txt') 