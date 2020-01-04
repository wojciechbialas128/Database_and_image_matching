function [img1, img2, img3] = imshow_normalised3(img1, img2, img3, show)
%imshow_normalise Wyœwietlenie 3 obrazów po znormalizowaniu wartoœci
%Funcja wyœwietla ka¿dy z argumentów jako obraz
close all;
    if nargin==0
        disp ("No input image args in imshow_normalise(img1, img2, img3)");
        return
    end
    if nargin <4 
        show=false; 
    end
    if nargin >0 
        img1=imresize(img1, [240 320]);
        img1= im2uint8(img1);
        img1=normalize_img(img1);
        if show
            f1=figure(1);
            f1.set('OuterPosition',[0 1080 460 340]);
            f1.set('MenuBar', 'none');
            f1.set('Name', 'Snapshot mono normalised');
            %size(img1)
            imshow (img1);%, [mint(img1) maxt(img1)])
        end
    end
    if nargin >1
        img2=imresize(img2, [240 320]);
        img2= im2uint8(img2);
        img2=normalize_img(img2);
        if show
            f2=figure(2); 
            f2.set('OuterPosition',[400 1080 460 340]);
            f2.set('MenuBar', 'none');
            f2.set('Name', 'Snapshot thermo normalised');
            %size(img2)
            imshow (img2);%, [mint(img2) maxt(img2)]);
        end
    end
    if nargin >2
        img3=imresize(img3, [240 320]);
        img3= im2uint8(img3);
        %img3=flip(img3 ,2);
        img3=normalize_img(img3);
        if show
            f3=figure(3); 
            f3.set('OuterPosition',[800 1080 460 340]);
            f3.set('MenuBar', 'none');
            f3.set('Name', 'Snapshot depth normalised');
            %size(img3)
            imshow (img3);%, [mint(img3) maxt(img3)])
        end
    end
    x=[num2str(min(nargin,3)), ' images normalised and converted to uint8'];
    disp(x);
end


