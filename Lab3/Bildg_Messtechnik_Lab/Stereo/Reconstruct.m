close all
clear all

addpath('../Helpers/')

% read the setup parameter
st=StereoSetup_readFromCalibData('Calib_Results_stereo.mat',5.6e-6,5.6e-6);

%TODO: open left and right image
im_left=imread('');
im_right=imread('');

figure(1);
imshow(im_left,[]);
title('Left Camera');

figure(2);
imshow(im_right,[]);
title('Right Camera');

% TODO: Threshold images:
im_left_bin = [];
im_right_bin = [];


props = {'Area','Centroid'};


features_left = regionprops(im_left_bin, props);
[~,i] = sort([features_left(:).Area],'descend');
features_left = reshape([features_left(i(1:3)).Centroid],2,3);

features_right = regionprops(im_right_bin, props);
[~,i] = sort([features_right(:).Area],'descend');
features_right = reshape([features_right(i(1:3)).Centroid],2,3);


stF=StereoSetup_computeFMatrix(st);
F=stF.FundamentalMatrix;

[e_left, e_right] = drawEpipolarLine(F,features_left,features_right);

% TODO: find corresponding points:
p_left=[];
p_right=[];
		
pt3D=StereoSetup_reconstruct3D(st, ...
							   undistortVector(st.LeftCamera, p_left),....
							   undistortVector(st.RightCamera, p_right));

figure(3);
plot3(pt3D(1,:),...
		 pt3D(2,:),...
		 pt3D(3,:),'r+');
title('Reconstructed Points');
grid on;

%TODO: Calculate Triangle's size(area and lengths):


