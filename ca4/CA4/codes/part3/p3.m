clc;
close all;
clear;


calling_customer (25, 2);



function calling_customer (n1, n2)
    if (n1 < 1 || n1 > 99 || n2 < 1 || n2 > 9)
        disp ("error");
    else
        [y1, fs] = audioread ("s.m4a");
        if (n1 < 20 || rem (n1, 10) == 0)
            name = string (n1) + ".m4a";
            [y2, fs2] = audioread (name);
        else
            name1 = string (n1 - rem (n1, 10)) + ".m4a";
            name2 = string (rem (n1, 10)) + ".m4a";
            [y2, fs2] = audioread (name1);
            [y3, fs2] = audioread ("v.m4a");
            [y4, fs2] = audioread (name2);
            y2 = [y2' y3' y4']';
        end
    
        [y3, fs2] = audioread ("b.m4a");
        [y4, fs2] = audioread (string (n2) + ".m4a");
    
        y = [y1' y2' y3' y4']';
    
        sound (y, fs);
    end
end