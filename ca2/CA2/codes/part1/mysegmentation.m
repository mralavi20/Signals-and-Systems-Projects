function [l, n] = mysegmentation (picture)
    objects = find_objects (picture);
    n = length (objects);
    l = zeros (size (picture));
    
    for i = 1:n
        object = objects{i};
        l(object(1, :), object(2, :)) = i;
    end
end