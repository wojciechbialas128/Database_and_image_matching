function [M m or ft pc EO T BWm] = P3C3(img1, img2, img3, show, levelbw1, levelbw2, levelbw3)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
close all;
if (nargin <4)
    show = false;
end
l3 = 0.1;
l2 = 0.4;
l1 = 0.4;
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

[M1 m1 or1 ft1 pc1 EO1 T1] = phasecong3(img1);
[M2 m2 or2 ft2 pc2 EO2 T2] = phasecong3(img2);
[M3 m3 or3 ft3 pc3 EO3 T3] = phasecong3(img3);
BWm1=imbinarize(m1,levelbw1);
BWm2=imbinarize(m2,levelbw2);
BWm3=imbinarize(m3,levelbw3);


if show==true
    title = "M1";
    figure ( 'Name',  title);
    imshow(M1);
    title = "M2";
    figure ( 'Name',  title);
    imshow(M2);
    title = "M3";
    figure ( 'Name',  title);
    imshow(M3);
    
    title = "m1";
    figure ( 'Name',  title);
    imshow(m1);
    title = "m2";
    figure ( 'Name',  title);
    imshow(m2);
    title = "m3";
    figure ( 'Name',  title);
    imshow(m3);
    
    title = "or1";
    figure ( 'Name',  title);
    imshow(or1);
    title = "or2";
    figure ( 'Name',  title);
    imshow(or2);
    title = "or3";
    figure ( 'Name',  title);
    imshow(or3);
    
    title = "ft1";
    figure ( 'Name',  title);
    imshow(ft1);
    title = "ft2";
    figure ( 'Name',  title);
    imshow(ft2);
    title = "ft3";
    figure ( 'Name',  title);
    imshow(ft3);
    
    title = "BMm1";
    figure ( 'Name',  title);
    imshow(BWm1);
    title = "BMm2";
    figure ( 'Name',  title);
    imshow(BWm2);
    title = "BMm3";
    figure ( 'Name',  title);
    imshow(BWm3);
end
end