function [y] = coding_amp (message, speed)
    mapset = cell (2, 32);

    characters = 'abcdefghijklmnopqrstuvmxyz ,;?.!';
    
    for i = 1:32
        mapset{1, i} = characters(i);
        mapset{2, i} = dec2bin (i - 1, 5);
    end
    
    m_size = length (message);
    m_code = cell (1, m_size);
    
    for i = 1:m_size
        c = message(i);
        index = strcmp (c, mapset(1,:));
        m_code{i} = mapset{2,index};
    end
    
    b = cell2mat (m_code);
    b_size = length (b);
    
    cn = linspace(0,1,2^speed);
    y=[];
    
    for i=1:speed:b_size
        m2="";
        for j=i:speed+i-1
            m2 = m2 + b(j);
        end
        for t=0:0.01:0.99
            y=[y,cn(bin2dec(m2)+1)*sin(2*pi*t)];
        end
    end
    
    disp (b);
    y = [y,0];
end