clc;
clearvars;

ts = 1e-9;
T = 1e-5;
tau = 1e-6;
t = 0:ts:T;
tlen = length (t);
x1 = zeros (1, tlen);

alpha = 0.5;


c = 300000000;
r = 450;

x2 = zeros (1, tlen);

td = (2 * r) / c;
index_td = (td * tlen) / T; % index_td = 3000
x2(3000:4000) = alpha;

d = [];
err = [];
j = 1;

for k = 0:0.2:20
    noise = k * rand (size (x2));
    y = x2 + noise;

    cor = zeros (1, tlen);

    for i = 1 : tlen - 1000
        temp = zeros (1, tlen);
        temp(i:i + 1000 - 1) = 1;
        cor(i) = temp*y';
    end

    max_index = find (cor == max (cor));

    t_max = t(max_index(1));

    d(j) = (c * t_max) / 2;
    
    err(j) = abs (d(j) - r);
    
    disp ([k d(j) err(j)]);
    
    j = j + 1;
end
mean_err = mean (err);
disp (mean_err);

plot (0:0.2:20, err);