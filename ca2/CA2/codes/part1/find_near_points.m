function [points, near_points] = find_near_points (points, first_point)
    different = abs (points - first_point);
    index = find (different (1, :) <= 1 & different (2, :) <= 1);
    near_points = points (:, index);
    points(:, index) = [];
end