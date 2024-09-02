clc;
clear;
close all;

fs = 8000;

num = [5 6 7 8 1 2 3 4];
y1 = [];

for i = 1:8
    a = make_signal (num(i));
    y1 = [y1 a];
end

sound (y1, fs);
audiowrite ("y.wav", y1, fs);

[y2, fs2] = audioread ("a.wav");

y2_length = length (y2);
nums = "";

plot (y2)

for i = 0:((y2_length / 1600) - 1)
    v = y2(i * 1600 + 1:i * 1600 + 800);
    c = [];
    for j = 0:9
        result = 0;
        sound = make_signal (j);
        for k = 1:length (v)
            result = result + (sound(k) * v(k));
        end
        c = [c result];
    end
    n = max (c);
    num = find (c == n) - 1;
    nums = append (nums, string (num));
end

disp (nums);