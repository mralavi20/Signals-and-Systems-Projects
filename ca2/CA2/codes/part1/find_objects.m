function objects = find_objects (picture)
    [r, c] = find (picture == 1);
    points = [r'; c'];
    objects_count = 1;
    points_count = size (points, 2);
    objects = {};

    while (points_count > 0)
        first_point = points(:, 1);
        points(:, 1) = [];
        [points, near_points] = find_near_points (points, first_point);
        object = [first_point near_points];
        near_points_count = size (near_points, 2);
    
        while (near_points_count > 0)
            near_points2 = [];
        
            for i = 1:near_points_count
                [points, near_points3] = find_near_points (points, near_points(:, i));
                near_points2 = [near_points2 near_points3];
            end
        
            object = [object near_points2];
            near_points = near_points2;
            near_points_count = size (near_points, 2);
        end
    
        objects{objects_count} = object;
        objects_count = objects_count + 1;
        points_count = size (points, 2);
    end
end