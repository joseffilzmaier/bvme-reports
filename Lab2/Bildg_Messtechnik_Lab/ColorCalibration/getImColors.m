function [ val ] = getImColors(img, c, r)

% consider the whole square:
d_img = double(img);
r_img = img(:,:,1);
g_img = img(:,:,2);
b_img = img(:,:,3);
new_val = zeros(size(c));
w = 3;
for i = 1:size(c)
    new_val(i,1) = mean(mean(r_img(r(i)-w:r(i)+w,c(i)-w:c(i)+w)));
    new_val(i,2) = mean(mean(g_img(r(i)-w:r(i)+w,c(i)-w:c(i)+w)));
    new_val(i,3) = mean(mean(b_img(r(i)-w:r(i)+w,c(i)-w:c(i)+w)));
%     x = int32(r(i)); y = int32(c(i));
%     J=regiongrowing(d_img,x,y,2);
%     new_val(i,1) = mean(r_img(J(:,:,1)==1));
%     new_val(i,2) = mean(g_img(J(:,:,1)==1));
%     new_val(i,3) = mean(b_img(J(:,:,1)==1));
end
val = new_val;
end
