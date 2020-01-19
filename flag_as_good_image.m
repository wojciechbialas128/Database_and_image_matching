function [] =flag_as_good_image();
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
[id,ic,it,nd,nc,nt] = take3synchronized_images(1);
code =cd ;
cd ..;
cd 'Multimodal image';
cd 'good ones';
cd 'Color_img'
imwrite (ic, nc);
imshow (ic);
cd ..;
cd 'Depth_img';
imwrite (id, nd);
cd ..;
cd 'Thermo_img';
%it = fliplr (it);
imwrite (it, nt);
cd (code);
end

