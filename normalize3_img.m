function [img1, img2, img3] = normalize3_img(img1, img2, img3)
    img1 = normalize_img (img1);
    img2 = normalize_img (img2);
    img3 = normalize_img (img3);
end