function [img1] = imshow_normalised(img1, show)
%imshow_normalise Wyœwietlenie 3 obrazów po znormalizowaniu wartoœci
%Funcja wyœwietla ka¿dy z argumentów jako obraz
close all;
    if nargin==0
        disp ("No input image args in imshow_normalise(img1, img2)");
        return
    end
    if nargin <2 
        show=false; 
    end
    if nargin >0 
        img1=imresize(img1, [240 320]);
        img1= im2uint8(img1);
        img1=normalize_img(img1);
        if show==1
           % f1=figure(1);
           % f1.set('OuterPosition',[0 1080 460 340]);
           % f1.set('MenuBar', 'none');
           % f1.set('Name', 'Snapshot mono normalised');
            %size(img1)
            imshow (img1);%, [mint(img1) maxt(img1)])
        end
    end
    x=[num2str(min(nargin,1)), ' images normalised and converted to uint8'];
    disp(x);
end


