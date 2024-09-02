function result = corr2 (x, y)
    result = sum (sum (x.*y)) / sqrt (sum (sum (x.*x)) * sum (sum (y.*y)));
end