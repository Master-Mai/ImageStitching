function [ result ] = stitch( I1, I2 )    
    Ia = single(rgb2gray(I1));
    Ib = single(rgb2gray(I2));

    [fa, da] = vl_sift(Ia);
    [fb, db] = vl_sift(Ib);
    [matches, ~] = vl_ubcmatch(da, db, 2.0);

    homography = RANSAC(matches, fa, fb, 10, 256);

    result = warp(homography, I1, I2);
end

