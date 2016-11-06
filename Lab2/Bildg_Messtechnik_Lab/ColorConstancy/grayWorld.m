function [ img_out ] = grayWorld( img_in )

img_out = double(img_in);

img_r = img_in(:,:,1);
L_i_mean(1) = mean(img_r(:));

img_g = img_in(:,:,1);
L_i_mean(2) = mean(img_g(:));

img_b = img_in(:,:,1);
L_i_mean(3) = mean(img_b(:));

for i=1:3
    img_out(:,:,i) = img_out(:,:,i) ./ double(L_i_mean(i));
end

img_out_v = sort(img_out(:),'descend');
max_out = img_out_v(floor(numel(img_out)*0.10));

img_out = img_out / max_out * 255;
img_out = min(img_out, 255);

img_out = uint8(img_out);

end

