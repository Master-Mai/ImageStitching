run vlfeat-0.9.20/toolbox/vl_setup

I1 = imread('images/dataset2/08.jpg');
I2 = imread('images/dataset2/09.jpg');
I3 = imread('images/dataset2/10.jpg');
I4 = imread('images/dataset2/11.jpg');
I5 = imread('images/dataset2/12.jpg');
I6 = imread('images/dataset2/13.jpg');
I7 = imread('images/dataset2/14.jpg');
I8 = imread('images/dataset2/15.jpg');
I9 = imread('images/dataset2/16.jpg');
I10 = imread('images/dataset2/17.jpg');
I11 = imread('images/dataset2/18.jpg');
I12 = imread('images/dataset2/19.jpg');
I13 = imread('images/dataset2/20.jpg');
I14 = imread('images/dataset2/21.jpg');
I15 = imread('images/dataset2/22.jpg');
I16 = imread('images/dataset2/23.jpg');
I17 = imread('images/dataset2/24.jpg');
I18 = imread('images/dataset2/25.jpg');

I1 = cylinder(I1, 750);
I2 = cylinder(I2, 750);
I3 = cylinder(I3, 750);
I4 = cylinder(I4, 750);
I5 = cylinder(I5, 750);
I6 = cylinder(I6, 750);
I7 = cylinder(I7, 750);
I8 = cylinder(I8, 750);
I9 = cylinder(I9, 750);
I10 = cylinder(I10, 750);
I11 = cylinder(I11, 750);
I12 = cylinder(I12, 750);
I13 = cylinder(I13, 750);
I14 = cylinder(I14, 750);
I15 = cylinder(I15, 750);
I16 = cylinder(I16, 750);
I17 = cylinder(I17, 750);
I18 = cylinder(I18, 750);

Panorama1 = stitch(I1, I2);
Panorama1 = stitch(I3, uint8(Panorama1));
Panorama1 = stitch(I4, uint8(Panorama1));
Panorama1 = stitch(I5, uint8(Panorama1));
Panorama1 = stitch(I6, uint8(Panorama1));

Panorama2 = stitch(I7, I8);
Panorama2 = stitch(I9, uint8(Panorama2));
Panorama2 = stitch(I10, uint8(Panorama2));
Panorama2 = stitch(I11, uint8(Panorama2));
Panorama2 = stitch(I12, uint8(Panorama2));

Panorama3 = stitch(I13, I14);
Panorama3 = stitch(I15, uint8(Panorama3));
Panorama3 = stitch(I16, uint8(Panorama3));
Panorama3 = stitch(I17, uint8(Panorama3));
Panorama3 = stitch(I18, uint8(Panorama3));

Panorama = stitch(uint8(Panorama1), uint8(Panorama3));
Panorama = stitch(uint8(Panorama2), uint8(Panorama));
figure, imshow(uint8(Panorama));
Panorama = crop2rect(Panorama);
figure, imshow(uint8(Panorama));