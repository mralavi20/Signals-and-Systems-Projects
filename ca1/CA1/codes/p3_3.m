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
index_tau = (tau * tlen) / T; % index_tau = 1000
index_tau = 1000;
index_td = (td * tlen) / T; % index_td = 3000
index_td = 3000;
x2(index_td:index_td + index_tau) = alpha;

cor = zeros (1, tlen);

for i = 1 : tlen - 1000
    temp = zeros (1, tlen);
    temp(i:i + 1000 - 1) = 1;
    cor(i) = temp*x2';
end

figure;
plot (t, cor);

max_index = find (cor == max (cor));

t_max = t(max_index(1));

d = (c * t_max) / 2;

disp (d);