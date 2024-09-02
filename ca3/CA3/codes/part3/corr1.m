function result = corr1 (image1, image2)
    image1 = double (image1);
    image2 = double (image2);
    
    s1 = size (image1);
    r1 = s1(1);
    c1 = s1(2);
    
    s2 = size (image2);
    r2 = s2(1);
    c2 = s2(2);
    
    r3 = r1 - r2 + 1;
    c3 = c1 - c2 + 1;
    
    result = zeros (r3, c3);
    
    for i = 1:r3
        for j = 1:c3
            image3 = double (image1 (i:i + r2 - 1, j:j + c2 - 1));
            result(i,j) = corr2 (image2, image3);
        end
    end
end