function [maxt] = maxt(table_img)
%mint Zwraca maksymaln� warto�� w tablicy zdj�cia
% 
s=size(table_img);
maxt=0;
for i=1:s(1)
    for j=1:s(2) 
        if (maxt<table_img(i,j))
            maxt=table_img(i,j);
        end
    end
end