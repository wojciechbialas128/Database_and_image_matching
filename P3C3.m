function [BWmd BWmc BWmt] = P3C3(imgd, imgc, imgt, show, levelbw1, levelbw2, levelbw3)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
close all;
if (nargin <4)
    show = false;
end
lt = 0.3; %thermo
lc = 0.3; %color
ld = 0.3;  %depth
% lt = 0.02; %thermo
% lc = 0.02; %color
% ld = 0.05;  %depth
if (nargin <5)
    levelbw1 = ld;
    levelbw2 = lc;
    levelbw3 = lt;
end

if (nargin == 5)
    levelbw2 = lc;
    levelbw3 = lt;
end

if (nargin == 6)
    levelbw3 = lt;
end

% [M1, md, or1, ft1, pc1, EO1, T1] = phasecong3(imgd);
% [M2, mc, or2, ft2, pc2, EO2, T2] = phasecong3(imgc);
% [M3, mt, or3, ft3, pc3, EO3, T3] = phasecong3(imgt);
md = phasecong(imgd);
mc = phasecong(imgc);
mt = phasecong(imgt);
[md, mc, mt] = normalize3_img(md,mc,mt);
% BWmd=imbinarize(md,levelbw1);
% BWmc=imbinarize(mc,levelbw2);
% BWmt=imbinarize(mt,levelbw3);

md = threshold(md ,55);
mc = threshold(mc ,55);
mt = threshold(mt ,55);
BWmd=md;
BWmc=mc;
BWmt=mt;

[BWmd,BWmc,BWmt] = set_location(BWmd, BWmc, BWmt);
if show==true
    title = "BMm1 - Depth Image";
    figure ( 'Name',  title);
    imshow(BWmd);
    title = "BMm2 - Color Image";
    figure ( 'Name',  title);
    imshow(BWmc);
    title = "BMm3 - Thermo Image";
    figure ( 'Name',  title);
    imshow(BWmt);
end
end