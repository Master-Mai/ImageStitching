function [ result ] = crop2rect( I )
    G = rgb2gray(I);
    threshold = 0.99;
    [h, w, ~] = size(I);
    left = 1;
    right = w;
    top = 1;
    bottom = h;
    flag = [false, false, false, false];
    while (nnz(flag) ~= 4)
        if (~flag(1))
            left = left + 1;
            if (sum(G(top : bottom, left)) / (bottom - top) >= threshold)
                flag(1) = true;
            end 
        end
        if (~flag(2))
            right = right - 1;
            if (sum(G(top : bottom, right)) / (bottom - top) >= threshold)
                flag(2) = true;
            end 
        end
        if (~flag(3))
            top = top + 1;
            if (sum(G(top, left : right)) / (right - left) >= threshold)
                flag(3) = true;
            end 
        end
        if (~flag(4))
            bottom = bottom - 1;
            if (sum(G(bottom, left : right)) / (right - left) >= threshold)
                flag(4) = true;
            end 
        end
    end
    
    result = imcrop(I, [left, top, right - left, bottom - top]);
end

