function [] = match3_img()
  [img1,img2,img3,name1,name2,name3]=take3synchronized_images;
  %normalizacja i zmiana wielkoœci:
  %[img1,img2,img3]=imshow_normalised3(img1,img2,img3,0);
  [pc1,pc2,pc3]=PC3(img1,img2,img3);
    imshow3(pc1,pc2,pc3); 
    %imshow3(pc1,pc2,pc3); 
    pause();
    close all;
    clear;
end

