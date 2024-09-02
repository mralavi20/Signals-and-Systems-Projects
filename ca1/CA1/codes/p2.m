load p2.mat

t = 0:0.001:1;

%plot (t,x)
%xlabel ('t')
%ylabel ('x')

%plot (t, y)
%xlabel ('t')
%ylabel ('y')


plot (x, y, '.')
xlabel ('x')
ylabel ('y')

%Test1: y = 2 * x
[alpha1, beta1] = p2_4 ([1 2 3], [2 4 6]);
disp ([alpha1 beta1]);

%Test2: y = 3 * x + 2 with noise
[alpha2, beta2] = p2_4 ([1 2 3], [5 8 11] + 0.2 * rand (1));
disp ([alpha2 beta2]);

[alpha, beta] = p2_4 (x, y);
disp ([alpha beta]);