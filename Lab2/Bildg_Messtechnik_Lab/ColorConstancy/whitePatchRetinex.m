function [ img_out ] = whitePatchRetinex( img_in )

img_out = double(img_in);

L_i_max(1) = max(max(img_in(:,:,1)));
L_i_max(2) = max(max(img_in(:,:,2)));
L_i_max(3) = max(max(img_in(:,:,3)));

L_i_max

for i=1:3
    img_out(:,:,i) = img_out(:,:,i) ./ double(L_i_max(i)) .* 255;
end

img_out = uint8(img_out);

end
