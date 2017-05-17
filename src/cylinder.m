function [result]=cylinder(I, f)
% Warp images to cylindrical coordinates
    result = uint8(zeros(size(I)));
    for i = 1 : 3
        cx = size(I, 2) / 2;
        cy = size(I, 1) / 2;
        x = (1 : size(I, 2)) - cx;
        y = (1 : size(I, 1)) - cy;
        [xx, yy] = meshgrid(x, y);
        yy = f * yy ./ sqrt(xx .^ 2 + double(f) ^ 2) + cy;
        xx = f * atan(xx / double(f)) + cx;
        xx = floor(xx + 0.5);
        yy = floor(yy + 0.5);
        idx = sub2ind([size(I, 1), size(I, 2)], yy, xx);
      
        cylinder = uint8(zeros(size(I, 1), size(I, 2)));
        cylinder(idx) = I(:, :, i);

        result(:, :, i) = cylinder;
    end
end