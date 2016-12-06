clear all
close all

addpath('../Helpers/');
addpath('../Helpers/CalibToolBox');

% SETTINGS:
img_type = '*.JPG';
img_dir = './CMM_sample_images/';
wrld_fname = './CMM_sample_images/wrld_point_coords.mat';

%% LOAD WRLD POINTS
load(wrld_fname);
pt_w_ = [PT; ones(1,size(PT,2))];

% EXTRACT IMAGE MEASUREMENTS
fnames = dir([img_dir img_type]);
N = size(fnames,1);
pt_i_ = ones(3, N);

for i=1:N
    img = im2double(imread([img_dir, fnames(i).name]));
    pt_i_(1:2,i) = markCorners(img,1);
end

% NORMALIZE POINTS
[pt_i_n, T] = normalizePoints( pt_i_ );
[pt_w_n, U] = normalizePoints( pt_w_ );

%% =========================================================================
% build A matrix:
% =========================================================================

% $$ x_i = P X_i $$

A = zeros(2*N,12);

for i = 1:10
   A(2*i-1,:) = [0 0 0 0 -(pt_i_n(3,i) * pt_w_n(:,i)') (pt_i_n(2,i) * pt_w_n(:,i)')];
   A(2*i,  :) = [(pt_i_n(3,i) * pt_w_n(:,i)') 0 0 0 0 -(pt_i_n(1,i) * pt_w_n(:,i)')];
end


%% SOLVE LIN SYSTEM
[~,~,V] = svd(A);
P_n = V(:,end);
P_n = reshape(P_n,4,3)';
P = T^(-1)*P_n*U;

%% =========================================================================
% TODO: decompose P matrix: P = K [R | t]
% hint: you can use the provided rq function
% =========================================================================
M = P(:,1:3);
C = - M \ P(:,4);

[K,R] = rq(M);
%R = R * K(3,3);
K = K / K(3,3);


%% focal length
f = K(1,1) * 4.3e-3 %in mm

%% show calculated image point vs. selected point
figure;
imshow(img);
pt = pt_w_(:,end);
px = P*pt;
x1 = 1/px(3) * px(1);
y1 = 1/px(3) * px(2);

hold on;
plot(x1,y1,'rx','MarkerSize',25);
plot(pt_i_(1,end),pt_i_(2,end),'bx','MarkerSize',25);