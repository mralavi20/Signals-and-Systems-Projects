function message = decoding (image, mapset)
    num = length (image);
    message = '';
    for i = 1:5:num
        a = '';
        for j = 0:4
            b = dec2bin (image (i + j), 5);
            a = append (a, b(end));
        end
        index = strcmp (a, mapset(2,:));
        message = append (message, mapset{1,index});
        
        c = mapset{1,index};
        if (strcmp (c, ';') == 1)
            break;
        end
    end
end