function [] = PanoramaStitching(img1, img2, features1, features2)
% [] = PanoramaStitching(img1, img2, features1, features2)
%
% PARAMS:
%   img1 left side 1-channel double precision image
%   img2 right side 1-channel double precision image
%   features1 2xN array containing coordinates of features in img1
%   features2 2xN array containing coordinates of features in img2
%
% This function stitches together img1 and img2 and displays the result.
% The necessary homography is computed using point corespondences given in
% the vectors features1 and features2.

image_size = size(img1);
image_width = image_size(2);
image_height = image_size(1);

%offset to move coordinates to the middle to get zero mean coordinates
normalization_offset_x = (image_width+1)/2;
normalization_offset_y = (image_height+1)/2;

%calculate distance matrix to normalize mean coordinate length to sqrt(2)
distance_x = ones(image_height,1)*(1:image_width)-normalization_offset_x;
distance_y = (1:image_height)'*ones(1,image_width)-normalization_offset_y;
distance_matrix = sqrt(distance_x.^2+distance_y.^2);
mean_distance = mean(distance_matrix(:));

%ransac algorithm parameters
num_matched_pixels = size(features1,2);

A = zeros(2*num_matched_pixels,9);

%normalization matrix to achieve zero mean coordinates and aan average
%absolute value of sqrt(2)
T = [sqrt(2)/mean_distance,0,0;0,sqrt(2)/mean_distance,0;0,0,1] * ...
    [1,0,-normalization_offset_x;0,1,-normalization_offset_y;0,0,1];

for match=0:(num_matched_pixels-1)
    cm = vertcat(features1(:,match+1),features2(:,match+1));
    %perform normalization without T
    cm(1) = (cm(1)-normalization_offset_x)*sqrt(2)/mean_distance;
    cm(2) = (cm(2)-normalization_offset_y)*sqrt(2)/mean_distance;
    cm(3) = (cm(3)-normalization_offset_x)*sqrt(2)/mean_distance;
    cm(4) = (cm(4)-normalization_offset_y)*sqrt(2)/mean_distance;
    A(1+match*2,:) = [0,0,0,-cm(1),-cm(2),-1,cm(4)*cm(1),cm(4)*cm(2),cm(4)];
    A(2+match*2,:) = [cm(1),cm(2),1,0,0,0,-cm(3)*cm(1),-cm(3)*cm(2),-cm(3)];
end

%calculate the vector h by performing a singular value decomposition
[~,~,V] = svd(A);
h = V(:,end);

%reshape and Tranform coordinate system to get H
H = reshape(h,3,3)';
H = T^-1*H*T;


%transform image
T = maketform('projective',H');
%J = imtransform(img2,T);

udata = [1 image_width];  vdata = [1 image_height];  % input coordinate system

[B,xdata,ydata] = imtransform(img1,T,'bicubic');

%display blended images
% x_alpha_begin = 1;
% x_alpha_end = round(xdata(2));
% mask_width = x_alpha_end-x_alpha_begin+1;
% B_mask = ones(size(B));
% B_mask(:,(end-mask_width+1):end) = ones(size(B,1),1)*((mask_width:-1:1)/mask_width);
% img2_mask = ones(size(img2));
% img2_mask(:,1:mask_width) = ones(size(img1,1),1)*((1:mask_width)/mask_width);

figure
hold on
h=imshow(B,'XData',xdata,'YData',ydata); axis on;
%set(h,'AlphaData',B_mask);
p=gca;
h=imshow(img2,'XData',udata,'YData',vdata, 'Parent', p); axis on;
%set(h,'AlphaData',img2_mask);



end
