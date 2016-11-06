function [ c, r, val ] = getSquareColors( img, N )
% Returns the color values of the selceted squares
%   Select squares by left clicking on a colored square. To finish the
%   selection press Return.
%   img ... input image
%   N ... number of selceted squares
figure;
[c, r, val] = impixel(img); close;
if size(val,1) > N
    val = val(1:N,:);
    c = c(1:N,:);
    r = r(1:N,:);
elseif size(val,1) > N
    disp('Error: to few points selected');
    return;
end
% hold on; plot(c,r,'g+'); hold off;

% consider the whole square:
d_img = double(img);
r_img = img(:,:,1);
g_img = img(:,:,2);
b_img = img(:,:,3);
new_val = zeros(size(val));
w = 3;
for i = 1:N
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

