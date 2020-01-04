function [mint] = mint(table_img)
%mint Zwraca minimaln¹ wartoœæ w tablicy zdjêcia
% 
s=size(table_img);
mint=int32(2^32);
for i=1:s(1)
    for j=1:s(2) 
        if (mint>table_img(i,j))
            mint=table_img(i,j);
        end
    end
end
