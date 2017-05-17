function [result] = blend(I1, I2, ox, oy)
    % Find masks of 2 images
    I1(isnan(I1)) = 0;
    result = zeros(size(I1));
    mask1 = (I1(:, :, 1) > 0 | I1(:, :, 2) > 0 | I1(:, :, 3) > 0);
    result(oy : oy + size(I2, 1) - 1, ox : ox + size(I2, 2) - 1, :) = I2;
    mask2 = (result(:, :, 1) > 0 | result(:, :, 2) > 0 | result(:, :, 3) > 0);
    
    % Blend 2 images
    result(:, :, 1) = result(:, :, 1) + I1(:, :, 1) .* mask1;
    result(:, :, 2) = result(:, :, 2) + I1(:, :, 2) .* mask1;
    result(:, :, 3) = result(:, :, 3) + I1(:, :, 3) .* mask1;
    result(oy : oy + size(I2, 1) - 1, ox : ox + size(I2, 2) - 1, :) = I2;
    
    % Cross dissolve
    mask = and(mask1, mask2);
    [~, col] = find(mask);
    left = min(col);
    right = max(col);
    for y = 1 : size(I1, 1)
        for x = 1 : size(I1, 2)
            if (mask(y, x))
                r = (x - left) / (right - left);
                if (ox < 2) 
                    r = 1 - r;
                end
                result(y, x, :) = I1(y, x, :) * (1 - r) + result(y, x, :) * r;
            elseif (mask2(y, x))
                result(y, x, :) = I2(y - oy + 1, x - ox + 1, :);
            elseif (mask1(y, x))
                result(y, x, :) = I1(y, x, :);
            end
        end
    end
end