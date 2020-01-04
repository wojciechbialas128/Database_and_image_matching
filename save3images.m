function [] = save3images(imgd,imgc,imgt,timed,timec,timet)
    dd='D:\Studia_files\INZYNIERKA_FILES\Newest_records\Depth_img\';
    dc='D:\Studia_files\INZYNIERKA_FILES\Newest_records\Color_img\';
    dt='D:\Studia_files\INZYNIERKA_FILES\Newest_records\Thermo_img\';
    dd=dd+string(timed)+'.png';
    dc=dc+string(timec)+'.png';
    dt=dt+string(timet)+'.png';
    imwrite (imgd, dd);
    imwrite (imgc, dc);
    imwrite (imgt, dt);
end

