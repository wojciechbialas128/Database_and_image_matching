function [] = imshow3(img1,img2,img3)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    if nargin==0
        disp ('No input image args in function [] = imshow3(img1,img2,img3)');
        return
    end
    if nargin >0
        figure(2);
        imshow(img1);
    end
    if nargin >1
        figure(3);
        imshow(img2);
    end
    if nargin >2
        figure(4);
        imshow(img3);
    end
end

