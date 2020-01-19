function [imgd, imgc, imgt] = resize3_img(src_d, src_c, src_t)
%resize3_img Przeskalowanie obrazów multimodalnych
%   W celu badania obrazów algorytmami KCF wymaga siê, aby skala obrazów
%   wzgêdem rzeczywistoœci by³a jednakowa. W tym celu nale¿y zwiêkszyæ
%   obraz termowizyjny. Kamera termowizyjna widzi w poziomie 25stopni, w
%   pionie 18,8, a Kinect Xbox 360  w poziomie 57,  w pionie 43, Kinect
%   Xbox One w poziomie 70, w pionie 60.
%
%   alfa - k¹t z kamery termowizyjnej
%   beta - k¹t z kinecta
%   c - wielkoœæ obrazu termowizyjnego
%   hc - wielkoœæ wyjœciowa obrazu termowizyjnego
%   h - mówi o ile pikseli nale¿y powiêkszyæ obraz termowizyjny, h = hc -c;
%
%   Stosowany wzór:
%         tan(beta)
%   hc = ----------- * c
%         tan(alfa)
%
%   h = hc -c;
kinect=0;
alfa_x=25/2;
alfa_y=18.8/2;
c_x = size (src_t,2);
c_y = size (src_t,1);
%sprawdzam z którego kinecta by³o robione ujêcie - wynika to z
%rodzielczoœci zdjêcia g³êbi (One - 512x424, 360 - 640x480)
if (size(src_d,2)==640 && size(src_d,1)==480)
    kinect = 1;
end
if (size(src_d,2)==512 && size(src_d,1)==424)
    kinect = 2;
end

%okreslenie parametrów Kinect;
if (kinect ~=0)
    disp (['Kinect v' num2str(kinect) ' images detected']);
    if kinect == 1
        beta_x = 57/2;
        beta_y = 43/2;
        corr_x =0.5;
        corr_y =0.5;
        %corr_x =0.65;
        %corr_y =0.70;
    end
    if kinect == 2
        beta_x = 70/2;
        beta_y = 60/2;
        corr_x =0.40;
        corr_y =0.34;
        %corr_x =2.40;
        %corr_y =2.34;
    end
    
    %skalowanie obrazów do porównania z obrazem RGB
    hc_x = corr_x*c_x*(tan(toRadians(beta_x))/tan(toRadians(alfa_x)));
    hc_y = corr_y*c_y*(tan(toRadians(beta_y))/tan(toRadians(alfa_y)));
    
    src_t = imresize (src_t, [hc_y hc_x]);
    src_t = imresize (src_t, [size(src_t,1)/2 size(src_t,2)/2]);
    if (size(src_c,2)~=640)
        src_c = imresize (src_c, [size(src_c,1)/2 size(src_c,2)/2]);
    end
    src_d = imresize (src_d, [0.95*size(src_d,1) 0.9*size(src_d,2)]);
    
    %obraz termowizyjny:
    %zrobienie takiej samej wielkoœci obrazów co RGB
    xc_size = size(src_c,2);
    yc_size = size(src_c,1);
    
    
    tmp = src_c;
    xt_size = size(src_t,2);
    yt_size = size(src_t,1);
    xt_diff = xc_size - xt_size;
    yt_diff = yc_size - yt_size;
    %wstawienie obrazu w³asciwego do tego o odpowiednim rozmiarze:
%     for iy=1:yc_size
%         for ix=1:xc_size
%            % tmp (iy,ix)=0;
%         end
%     end
%     for iy=yt_diff/2:(yt_diff/2+yt_size-1)
%         for ix=xt_diff/2:(xt_diff/2+xt_size-1)
%             tmp (iy+10,ix-80)=src_t( iy-yt_diff/2+1,ix-xt_diff/2+1);
%         end
%     end
%     src_t=tmp;
    
    %obraz g³êbokoœci
    %zrobienie takiej samej wielkoœci obrazów co RGB
    xc_size = size(src_d,2);
    yc_size = size(src_d,1);
    
    tmp = src_d;
    xd_size = size(src_d,2);
    yd_size = size(src_d,1);
    xd_diff = xc_size - xd_size;
    yd_diff = yc_size - yd_size;
    %wstawienie obrazu w³asciwego do tego o odpowiednim rozmiarze:
%    tmp(yd_diff/2:yd_diff/2+yd_size-1, xd_diff/2:xd_diff/2+xd_size-1)=src_d;
    src_d=tmp;
    
    
else %zdjecie g³êbooœci by³o przeskalowane, lub nie zosta³o wykonane urz¹dzeniem kinect
    disp('Wrong images in funtion resize3_img(src_d, src_c, src_t)');
end
    imgd = src_d; 
    imgc = src_c;
    imgt = src_t;
end

