function [BWm1 BWm2 BWm3] = P3C3(imgd, imgc, imgt, show, levelbw1, levelbw2, levelbw3)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
close all;
if (nargin <4)
    show = false;
end
l3 = 0.1;
l2 = 0.15;
l1 = 0.25;
if (nargin <5)
    levelbw1 = l1;
    levelbw2 = l2;
    levelbw3 = l3;
end

if (nargin == 5)
    levelbw2 = l2;
    levelbw3 = l3;
end

if (nargin == 6)
    levelbw3 = l3;
end

[M1 m1 or1 ft1 pc1 EO1 T1] = phasecong3(imgd);
[M2 m2 or2 ft2 pc2 EO2 T2] = phasecong3(imgc);
[M3 m3 or3 ft3 pc3 EO3 T3] = phasecong3(imgt);
BWm1=imbinarize(m1,levelbw1);
BWm2=imbinarize(m2,levelbw2);
BWm3=imbinarize(m3,levelbw3);

if show==true
    title = "BMm1 - Depth Image";
    figure ( 'Name',  title);
    imshow(BWm1);
    title = "BMm2 - Color Image";
    figure ( 'Name',  title);
    imshow(BWm2);
    title = "BMm3 - Thermo Image";
    figure ( 'Name',  title);
    imshow(BWm3);
end
end