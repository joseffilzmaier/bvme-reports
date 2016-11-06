function [ img_out ] = whitePatchRetinexHist( img_in )

img_out = double(img_in);

img_r = img_in(:,:,1);
img_r = sort(img_r(:), 'descend');
L_i_max(1) = img_r(floor(numel(img_r)*0.05));

img_g = img_in(:,:,1);
img_g = sort(img_g(:), 'descend');
L_i_max(2) = img_g(floor(numel(img_g)*0.05));

img_b = img_in(:,:,1);
img_b = sort(img_b(:), 'descend');
L_i_max(3) = img_b(floor(numel(img_b)*0.05));

for i=1:3
    img_out(:,:,i) = img_out(:,:,i) ./ double(L_i_max(i)) .* 255;
end

img_out = uint8(img_out);

end

