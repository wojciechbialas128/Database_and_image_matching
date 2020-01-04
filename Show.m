function [] = Show(cam1,cam2, ile)
%Show do usuniêcia, bo b³êdy
for i=0:ile
    img=snapshot(cam1);
    imf=snapshot(cam2);
    imshow (img);
    wait(500);
    imshow(imf);
    wait(500);
end

