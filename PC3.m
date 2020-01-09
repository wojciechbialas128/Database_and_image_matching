function [pc1,pc2,pc3] = PC3(img1, img2, img3)
    if nargin==0
        disp ('No input image args in function [imgs_params] = PC(img1, img2, img3)');
        return
    end
    if nargin >0 
        pc1=phasecong(img1);
    end
    if nargin >1 
        pc2=phasecong(img2);
    end
    if nargin >2 
        pc3=phasecong(img3);
    end
end