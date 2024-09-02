function p4_3 (x, speed, fs)
    xlen = length (x);
    if (speed == 2)
        x2 = x;
        for i = 1:xlen / 2
            x2(i) = [];
        end
        sound (x2, fs);
    elseif (speed == 0.5)
        x2 = zeros (2 * xlen);
        j = 1;
        for i = 1:2 * xlen
            if (rem (i, 2) == 1)
                x2(i) = x(j);
            else
                x2(i) = (x(j) + x(j + 1)) / 2;
                j = j + 1;
            end
        end
        sound (x2, fs);
    else
        disp ("error");
    end
end
    