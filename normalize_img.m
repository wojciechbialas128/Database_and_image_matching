function [out] = normalize_img(src)
%normalize_img Wykonuje normalizacje obrazu do zakresu [0,255]
%  dodatkowo skaluje na wymiar 320x240 i typ uint8
    src=im2uint8(src); %error???
    min0=uint8(mint(src));
    max0=uint8(maxt(src));
    %a=ax+b
    %nowe (przy b=0)
    src=src-min0; 
    %min1=uint8(0);
    max1=uint8((2^8)-1);
    max0=uint8(max0-min0);
    %min0=uint8(0);
    a=double(max1)/double(max0);
    out=src.*a;
end

