function picture = myremovecom (picture, n)
    objects = find_objects (picture);
    
    for i = 1:length (objects)
        object = objects{i};
        
        if (length (object) < n)
            picture(object(1, :), object(2, :)) = 0;
        end
    end
end