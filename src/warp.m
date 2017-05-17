function [result] = warp(homography, I1, I2)
    [h1, w1, ~] = size(I1);
    [h2, w2, ~] = size(I2);

    % Convert to homogeneous coordinates
    coords = ones(3, h1 * w1);
    for x = 1 : w1
        for y = 1 : h1
            coords(1 : 2, (x - 1) * h1 + y) = [x; y];
        end
    end

    % Find the coordinates of borders
    coords = homography \ coords;
    left = round(min([1, min(coords(1, :) ./ coords(3, :))]));
    right = round(max([w2, max(coords(1, :) ./ coords(3, :))]));
    top = round(min([1, min(coords(2, :) ./ coords(3, :))]));
    bottom = round(max([h2, max(coords(2, :) ./ coords(3, :))]));

    % The height and width of warped image
    height = bottom - top + 1;
    width = right - left + 1;

    % (ox1, oy1), (ox2, oy2) denote the coordinates' offsets of I1, I2
    ox1 = left;
    oy1 = top;
    ox2 = 2 - left;
    oy2 = 2 - top;
    
    temp = ones(3, width * height);
    for x = 1 : width
        for y = 1 : height
            temp(1 : 2, (x - 1) * height + y) = [ox1 + x - 1; oy1 + y - 1];
        end
    end
    temp = homography * temp;

    % Interpolation and warping
    result = zeros(height, width, 3);
    [X, Y] = meshgrid(1 : w1, 1 : h1);
    XI = reshape(temp(1, :) ./ temp(3, :), height, width);
    YI = reshape(temp(2, :) ./ temp(3, :), height, width);
    result(:, :, 1) = interp2(X, Y, double(I1(:, :, 1)), XI, YI);
    result(:, :, 2) = interp2(X, Y, double(I1(:, :, 2)), XI, YI);
    result(:, :, 3) = interp2(X, Y, double(I1(:, :, 3)), XI, YI);

    % Blend using Cross dissolution
    result = blend(result, I2, ox2, oy2);
end
