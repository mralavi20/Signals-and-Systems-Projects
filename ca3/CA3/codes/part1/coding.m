function image2 = coding (message, image, mapset)
    m_size = length (message);
    m_code = cell (1, m_size);
    image2 = image;
    
    pixels_num = length (image);
    
    if (pixels_num < 5 * m_size)
        disp ("error");
    else 
        for i = 1:m_size
            c = message(i);
            index = strcmp (c, mapset(1,:));
            m_code{i} = mapset{2,index};
        end
    
        b = cell2mat (m_code);
        b_size = length (b);
    
        for i = 1:b_size
            binary_num = dec2bin (image(i));
            binary_num(end) = b(i);
            image2(i) = bin2dec (binary_num);
        end
    end
end