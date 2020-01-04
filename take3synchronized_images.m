function [img1, img2, img3, dir1 ,dir2, dir3] = take3synchronized_images(image_number) 
 if nargin==0
     image_number=1;
 end
 if image_number<1
     return;
 end
 
 %wyszukiwanie obrazów najlepiej dopasowanych czasowo do obrazu g³êbokoœci
 %obrazu
 namesd=dir('D:\Studia_files\INZYNIERKA_FILES\Newest_records\Depth_img\20*');
 namesc=dir('D:\Studia_files\INZYNIERKA_FILES\Newest_records\Color_img\20*');
 namest=dir('D:\Studia_files\INZYNIERKA_FILES\Newest_records\Thermo_img\20*');
 namesd = {namesd.name};
 namesc = {namesc.name};
 namest = {namest.name};
 namesd = char (namesd);
 namesc = char (namesc);
 namest = char (namest);
 
 tmp=size(namesd);
 image_number=min(image_number,tmp(1));
 dird=char(namesd(image_number,:));
 timed=read_dir_as_num(dird);
 
 min_diff=timed;
 dirc=dird;
 tmp=size(namesc);
 for r=1:tmp(1)  
    if abs(read_dir_as_num(char(namesc(r,:)))-timed)<abs(min_diff)
        dirc=char(namesc(r,:));
        min_diff=read_dir_as_num(char(namesc(r,:)))-timed;
   % else
      %  break; %nie sprawdzam dla wszystkich plików....
    end
 end
 
 min_diff=timed;
 dirt=dird;
 tmp=size(namest);
 for r=1:tmp(1)   
    if abs(read_dir_as_num(char(namest(r,:)))-timed)<abs(min_diff)
        dirt=char(namest(r,:));
        min_diff=read_dir_as_num(char(namest(r,:)))-timed;
    %else
       % break; %nie sprawdzam dla wszystkich plików....
    end
 end
 dir1=dird;
 dir2=dirc;
 dir3=dirt;
 disp('Depth image:');
 disp(dir1);
 disp('Color image:');
 disp(dir2);
 disp('Thermo image:');
 disp(dir3);

 %otwieranie:
 dir0='D:\Studia_files\INZYNIERKA_FILES\Newest_records\';
 tmp=[dir0,'Depth_img\',dir1];
 img1=imread(tmp);
 tmp=[dir0,'Color_img\',dir2];
 img2=imread(tmp);
 img2=rgb2gray(img2);
 tmp=[dir0,'Thermo_img\',dir3];
 img3=imread(tmp);
 img3=rgb2gray(img3);
 %img3=img3(1:(size(img3,1))-10,1:size(img3,2)); %%ucinam, bo jest czarna linia na dole
 img3=flip(img3,2);
end

