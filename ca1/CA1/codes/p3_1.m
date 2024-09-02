clc;
clearvars;

ts = 1e-9;
T = 1e-5;
tau = 1e-6;
t = 0:ts:T;
tlen = length (t);
x1 = zeros (1, tlen);

alpha = 0.5;


index_tau = (tau * tlen) / T; % index_tau = 1000
index_tau = 1000;
x1(1:index_tau) = alpha;

plot (t, x1);
ylim ([-1 2]);

