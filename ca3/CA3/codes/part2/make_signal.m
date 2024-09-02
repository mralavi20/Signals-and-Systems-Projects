function y = make_signal (num)
    if (num == 0)
        k = 4;
        j = 2;
    else
        k = ceil (num / 3);
        j = rem (num, 3);
    
        if (j == 0)
            j = 3;
        end
    end
    
    fr = [697 770 852 941];
    fc = [1209 1336 1477];
    fs = 8000;
    Ts = 1/fs;
    Ton = 0.1;
    Toff = 0.1;
    t = 0:Ts:Ton;
    y1 = sin(2*pi*fr(k)*t);
    y2 = sin(2*pi*fc(j)*t);
    y = (y1 + y2)/2;
end