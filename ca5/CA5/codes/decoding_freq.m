function message = decoding_freq (y, speed)
    mapset = cell (2, 32);

    characters = 'abcdefghijklmnopqrstuvmxyz ,;?.!';
    
    for i = 1:32
        mapset{1, i} = characters(i);
        mapset{2, i} = dec2bin (i - 1, 5);
    end
    
    fs = 100;
    n = size (y, 2);
    f = 0:fs/n:fs/2-fs/n;
    
    s = size (y, 2);
    y2 = [];
    for i = 0:1:s/100 - 1
        p = y(1,i*100+1:i*100+100);
        fp = fftshift(fft(p));
        fp2 = fp / abs (max(fp));
        fp3 = fp2(1, 51:100);
        [~,k] = max (abs (fp3));
        y2 = [y2, k - 1];
    end
    
    c = [];
    for i = 49 / (2^(speed+1)) : 49/2^speed : 49
        c = [c, round(i)];
    end
    
    s2 = size (y2, 2);
    y3 = [];
    for i = 1:1:s2
        [~,k]=min(abs(c-y2(i)));
        y3 = [y3,dec2bin(k-1,speed)];
    end
    
    s3 = length (y3);
    m = "";
    for i = 1:s3/5
        p = y3((5*(i-1)+1):5*i);
        index = find (strcmp (mapset, p));
        m = m + mapset (1, index / 2);
    end
    
    message = m;
end