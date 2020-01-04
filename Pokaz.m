function [] = Pokaz(g,f)
%Pokaz Wyœwietla 2 obrazy z dwóch kamer
img=snapshot(g);
%milliPause(10);
imf=snapshot(f);
%milliPause(10);
figure (1);
imshow(img);
figure(2);
imshow(imf);
end

