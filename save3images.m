function [] = save3images(imgd,imgc,imgt,timed,timec,timet)
  	dir_code = cd;
    cd ..;
    dir_main = cd;
    dir_images = [dir_main '\Multimodal image']; 
    
    if  isfolder([dir_main '/Multimodal image'])==0
        mkdir ('Multimodal image');  
        disp(['Created new dirctionaries in: ' dir_images]);
        cd (dir_images)
        mkdir ('Depth_img');
        mkdir ('Color_img');
        mkdir ('Thermo_img');
    end  
    cd (dir_code);

    dd=[dir_images '\Depth_img\'];
    dc=[dir_images '\Color_img\'];
    dt=[dir_images '\Thermo_img\'];
    dd=dd+string(timed)+'.png';
    dc=dc+string(timec)+'.png';
    dt=dt+string(timet)+'.png';
    imwrite (imgd, dd);
    imwrite (imgc, dc);
    imwrite (imgt, dt);
end

