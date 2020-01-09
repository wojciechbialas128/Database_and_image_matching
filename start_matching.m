function [BWmt BWmc BWmd] = start_matching(imgt,imgc,imgd)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
close all;

if (nargin<3)
    clear;
    [imgd,imgc,imgt,name1,name2,name3]=take3synchronized_images();
end
tmp = imgc;
imgc = zeros(960,1280);
imgc(1:size(tmp,1), 1:size(tmp,2))=tmp;
clear tmp;
%tmp = imgd;
%imgd = zeros(960,1280);
%imgd(1:size(tmp,1), 1:size(tmp,2))=tmp;
%clear tmp;*/

tmp = imgt;
imgt = zeros(960,1280);
imgt(1:size(tmp,1), 1:size(tmp,2))=tmp;
clear tmp;

imgd = imresize(imgd, [960, 1280], 'nearest');
%imgc = imresize(imgc, [960, 1280], 'nearest');
%imgt = imresize(imgt, [960, 1280], 'nearest');
[BWmd,BWmc,BWmt] = P3C3(imgd, imgc, imgt, false);
cd ('tracker_release2');
cd ('data');
cd ('Benchmark');
cd ('img3');
%imwrite(imgt, '1.jpg', 'jpg');
%imwrite(imgc, '2.jpg', 'jpg');
%imwrite(imgd, '3.jpg', 'jpg');
cd ('img');
imwrite(BWmt, '1.jpg', 'jpg');
imwrite(BWmc, '2.jpg', 'jpg');
imwrite(BWmd, '3.jpg', 'jpg');
imwrite(imgt, '4.jpg', 'jpg');
imwrite(imgc, '5.jpg', 'jpg');
imwrite(imgd, '6.jpg', 'jpg');
cd ..;
cd ..;
cd ..;
cd ..;
cd ..
cd tracker_release2\
run_tracker();
end


