function [] = match3_img(numer_obrazu_w_folderze)
  if(nargin==0) 
      numer_obrazu_w_folderze=1;
  end
  [img1,img2,img3,name1,name2,name3]=take3synchronized_images(numer_obrazu_w_folderze);
  disp(name1);
  disp(name2);
  disp(name3);
  %normalizacja i zmiana wielkoœci:
  %[img1,img2,img3]=imshow_normalised3(img1,img2,img3,0);
  [pc1,pc2,pc3]=PC3(img1,img2,img3);
  
  while(1)
    disp('pc');
    imshow3(pc1,pc2,pc3); 
    pause();
        
    disp('edge');
    b1=edge(pc1);
    b2=edge(pc2);
    b3=edge(pc3); 
    imshow3(b1,b2,b3);
    pause();
    
    disp('edge-prewitt');
    b1=edge(pc1,'prewitt');
    b2=edge(pc2,'prewitt');
    b3=edge(pc3,'prewitt'); 
    imshow3(b1,b2,b3);
    pause();
    
    disp('edge-sobel');
    b1=edge(pc1,'sobel');
    b2=edge(pc2,'sobel');
    b3=edge(pc3,'sobel');
    imshow3(b1,b2,b3);
    pause();
    
    disp('edge-roberts');
    b1=edge(pc1,'roberts');
    b2=edge(pc2,'roberts');
    b3=edge(pc3,'roberts');
    imshow3(b1,b2,b3);
    pause();
    
    disp('edge-  Laplacian of Gaussian Method');
    b1=edge(pc1,'log');
    b2=edge(pc2,'log');
    b3=edge(pc3,'log');
    imshow3(b1,b2,b3);
    pause();
    
    disp('edge-  Canny Method');
    b1=edge(pc1,'canny');
    b2=edge(pc2,'canny');
    b3=edge(pc3,'canny');
    imshow3(b1,b2,b3);
    pause();
    
    disp('edge- approxcanny');
    b1=edge(pc1,'approxcanny');
    b2=edge(pc2,'approxcanny');
    b3=edge(pc3,'approxcanny');
    imshow3(b1,b2,b3);
    pause();
  end
end

