function [src] = threshold(src, value)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
if (nargin ~=2)
    value = 55;
end
for ix = 1:size(src,2)
    for iy = 1:size(src,1)
        if src(iy, ix)<value
            src (iy, ix)= 0;
        end
    end
end
end

