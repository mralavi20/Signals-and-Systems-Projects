function [alpha, beta] = p2_4 (x, y)
    f1 = @(x2, y2, a) (y2 - (a(1) * x2) - a(2)).^2;
    f2 = @(a) sum (f1 (x, y, a));
    a2 = fminsearch (f2, [0 1]);
    alpha = a2(1);
    beta = a2(2);
end