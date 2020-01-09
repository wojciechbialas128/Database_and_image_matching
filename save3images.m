function [] = save3images(imgd,imgc,imgt,timed,timec,timet,folder_name)
if (nargin <7)
    folder_name ='default';
end
dir_code = cd;
cd ..;
dir_main = cd;
dir_images = [dir_main '\Multimodal image'];
%color = [dir_images '\Color_img'];
%depth = [dir_images '\Depth_img'];
%thermo = [dir_images '\Thermo_img'];

if  isfolder(dir_images)==0
    mkdir ('Multimodal image');
    disp(['Created new dictionary: ' dir_images]);
end
cd (dir_images)

dir_folder =[dir_images '\' folder_name] ;
if  isfolder(dir_folder)==0
    mkdir (folder_name);
    dir_images = [dir_images '\' folder_name];
    disp(['Created new dictionary: ' dir_images]);
    
end

color = [dir_folder '\Color_img'];
depth = [dir_folder '\Depth_img'];
 thermo = [dir_folder '\Thermo_img'];
 
cd (folder_name)
if  isfolder([dir_folder '\Color_img'])==0
    mkdir ('Color_img');
    
    disp(['Created new dictionary: ' color]);
end

if  isfolder([dir_folder '\Depth_img'])==0
    mkdir ('Depth_img');
    
    disp(['Created new dirctionary: ' depth]);
end

if  isfolder([dir_folder '\Thermo_img'])==0
    mkdir ('Thermo_img');
   
    disp(['Created new dictionary: ' thermo]);
end


cd (dir_code);

dd=[depth '\'];
dc=[color '\'];
dt=[thermo '\'];
dd=dd+string(timed)+'.jpg';
dc=dc+string(timec)+'.jpg';
dt=dt+string(timet)+'.jpg';
imwrite (imgd, dd);
imwrite (imgc, dc);
imwrite (imgt, dt);
end

