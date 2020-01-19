function [imgd, imgc, imgt] = set_location(src_d, src_c, src_t)
%set_location Funkcja zmienia rozmiar obrazów na rozmiar obrazu RGB, bez
%skalowania, lecz dodaje czarne piksele.
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
     for iy=1:yc_size
         for ix=1:xc_size
             tmp (iy,ix)=0;
         end
     end
     
     if (mod(yt_diff,2)==1)yt_diff = yt_diff + 1;end
     if (mod(xt_diff,2)==1)xt_diff = xt_diff + 1;end
     
     for iy=yt_diff/2:(yt_diff/2+yt_size-1)
         for ix=xt_diff/2:(xt_diff/2+xt_size-1)
             tmp (iy-20,ix-105)=src_t( iy-yt_diff/2+1,ix-xt_diff/2+1);
         end
     end
     src_t=tmp;
     
    %obraz g³êbokoœci
    %zrobienie takiej samej wielkoœci obrazów co RGB
    tmp = src_c;
    xd_size = size(src_d,2);
    yd_size = size(src_d,1);
    xd_diff = xc_size - xd_size;
    yd_diff = yc_size - yd_size;
    %wstawienie obrazu w³asciwego do tego o odpowiednim rozmiarze:
     for iy=1:yc_size
         for ix=1:xc_size
             tmp (iy,ix)=0;
         end
     end
     
     if (mod(yd_diff,2)==1)yd_diff = yd_diff + 1;end
     if (mod(xd_diff,2)==1)xd_diff = xd_diff + 1;end
     
     for iy=yd_diff/2:(yd_diff/2+yd_size-1)
         for ix=xd_diff/2:(xd_diff/2+xd_size-1)
             tmp (iy+10,ix)=src_d( iy-yd_diff/2+1,ix-xd_diff/2+1);
         end
     end
     src_d=tmp;
     
  	 imgd = src_d; 
     imgc = src_c;
     imgt = src_t;
end

