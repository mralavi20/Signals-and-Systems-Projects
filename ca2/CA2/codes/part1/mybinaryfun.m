function picture2 = mybinaryfun (picture)
    for i = 1:300
        for j = 1:500
            if (picture(i,j) < 100)
                picture2(i, j) = 1;
            else
                picture2(i, j) = 0;
            end
        end
    end
end