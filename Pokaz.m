function [] = Pokaz(g,f)
%Pokaz Wy�wietla 2 obrazy z dw�ch kamer
img=snapshot(g);
%milliPause(10);
imf=snapshot(f);
%milliPause(10);
figure (1);
imshow(img);
figure(2);
imshow(imf);
end

