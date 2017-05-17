run vlfeat-0.9.20/toolbox/vl_setup

I1 = imread('images/dataset1/pano1_0008.bmp');
I2 = imread('images/dataset1/pano1_0009.bmp');
I3 = imread('images/dataset1/pano1_0010.bmp');
I4 = imread('images/dataset1/pano1_0011.bmp');
I1 = cylinder(I1, 750);
I2 = cylinder(I2, 750);
I3 = cylinder(I3, 750);
I4 = cylinder(I4, 750);
Panorama = stitch(I1, I2);
Panorama = stitch(uint8(Panorama), I3);
Panorama = stitch(uint8(Panorama), I4);
imshow(uint8(Panorama));
Panorama = crop2rect(Panorama);
figure, imshow(uint8(Panorama));