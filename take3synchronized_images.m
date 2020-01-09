function [img1, img2, img3, dir1 ,dir2, dir3] = take3synchronized_images() 
 
 %wyszukiwanie obrazów najlepiej dopasowanych czasowo do obrazu g³êbokoœci
 %obrazu
 dir_code = cd;
 cd ..;
 dir_main = cd;
 cd (dir_code);



 
 
 filter_image= '*.jpg'; %zapis programem tylko do jpg
img_type_folder = 'null';
while (~(strcmp(img_type_folder,'Depth_img') || strcmp(img_type_folder,'Color_img') || strcmp(img_type_folder,'Thermo_img')))
    cd ..;
    cd ('Multimodal image');
    [file,path] = uigetfile(filter_image, 'Wybierz zdjecie z podfoderu Multimodal image');
    cd (dir_code);
    if (size(path,2)<=1) 
        disp('Action canceled');
        return;
    end

    path = path(1:(size(path,2)-1));
    
    for i=size(path,2):-1:1
        if (path(i)=='\') 
            img_type_folder = path(i+1:size(path,2));
            for k=i-1:-1:1
                if (path(k)=='\') 
                    folder =  path(k+1:i-1);
                    break;
                end
            end
        	break;
        end
    end
    if(~(strcmp(img_type_folder,'Depth_img') || strcmp(img_type_folder,'Color_img') || strcmp(img_type_folder,'Thermo_img')))
        disp('Wybierz obraz zapisany przy u¿yciu funkcji start_acquisition(...) w podfolderze folderu Multimodal image');
    end
end
 
 cd (dir_code);
 time_ms=read_dir_as_num(file);

 dir_images = [dir_main  +'\' +'Multimodal image\' folder] ;
 depth = [dir_images '\Depth_img'];
 color = [dir_images '\Color_img'];
 thermo= [dir_images '\Thermo_img'];
  
 cd (dir_code);
 namesd=dir([depth '\20*']);
 namesc=dir([color '\20*']);
 namest=dir([thermo '\20*']);
 namesd = {namesd.name};
 namesc = {namesc.name};
 namest = {namest.name};
 namesd = char (namesd);
 namesc = char (namesc);
 namest = char (namest);
 
 if (~strcmp(path,depth))
	min_diff=time_ms;
    for r=1:size(namesd)
        if abs(read_dir_as_num(char(namesd(r,:)))-time_ms)<abs(min_diff)
            dird=char(namesd(r,:));
            min_diff=read_dir_as_num(char(namesd(r,:)))-time_ms;
            % else
                %  break; %nie sprawdzam dla wszystkich plików....
        end
    end
 else 
     dird = file;
 end


 
 
 if (~strcmp(path,color))
	min_diff=time_ms;
    for r=1:size(namesc)
        if abs(read_dir_as_num(char(namesc(r,:)))-time_ms)<abs(min_diff)
            dirc=char(namesc(r,:));
            min_diff=read_dir_as_num(char(namesc(r,:)))-time_ms;
            % else
                %  break; %nie sprawdzam dla wszystkich plików....
        end
    end
 else 
     dirc = file;
 end

  if (~strcmp(path,thermo))
	min_diff=time_ms;
    for r=1:size(namest)
        if abs(read_dir_as_num(char(namest(r,:)))-time_ms)<abs(min_diff)
            dirt=char(namest(r,:));
            min_diff=read_dir_as_num(char(namest(r,:)))-time_ms;
            % else
                %  break; %nie sprawdzam dla wszystkich plików....
        end
    end
 else 
     dirt = file;
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
 dir0=[dir_images '\'];
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

