function message = decoding_amp (y, speed)
    mapset = cell (2, 32);

    characters = 'abcdefghijklmnopqrstuvmxyz ,;?.!';
    
    for i = 1:32
        mapset{1, i} = characters(i);
        mapset{2, i} = dec2bin (i - 1, 5);
    end
    
    x=linspace(0,(size(y,2)-1)/100,size(y,2));
    
    
    c = [];
    f = sin (2 * pi * x);
    s = size (y, 2);
    
    for i = 1:(s - 1) / 100
        a = 0;
        for j = 100*(i-1)+1:i*100
            a = a +y(j).*f(j);
        end
        c =[c, a/100*2];
    end
    
    c = c*(2^speed-1);
    c = round (c);
    
    b = [];
    
    for i=1:(s-1)/100
        w = dec2bin(c(i),speed);
        b = [b , w] ;
    end
    
    message = "";
    
    b_size = length (b);
    
    for i=1:b_size/5
        a = b((5*(i-1)+1):5*i);
        index = find (strcmp (mapset, a));
        message = message + mapset (1,index / 2);
    end
end
    