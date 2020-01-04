function [img] = take_frame(cam)
%   Zwraca obraz uchwycony z kamery podajnej w argumencie funckji
%   
    img=snapshot(cam);
    imshow(img);
end

