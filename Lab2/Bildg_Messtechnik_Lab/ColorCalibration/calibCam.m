function [ n_img ] = calibCam( val_img, val_target, img )
% Color camera calibration
% Input:
%   val_img ... rgb color values of the image (Nx3)
%   val_target ... rgb color values of the calibration pattern (Nx3)
%   img ... original image
%
% Return:
%   n_img ... calibrated image
N = size(val_img,1); % N = number of patches

M = val_img \ val_target;

n_img = img;

% split RGB-image to color channels
imgR = img(:,:,1);
imgG = img(:,:,2);
imgB = img(:,:,3);
img2 = [imgR(:), imgG(:), imgB(:)];

% adjust colors
img2 = M * double(img2)';
img2 = img2';

% reshape color channels back to RGB-image
n_img(:,:,1) = reshape(img2(:,1), size(img,1), size(img,2));
n_img(:,:,2) = reshape(img2(:,2), size(img,1), size(img,2));
n_img(:,:,3) = reshape(img2(:,3), size(img,1), size(img,2));

end

