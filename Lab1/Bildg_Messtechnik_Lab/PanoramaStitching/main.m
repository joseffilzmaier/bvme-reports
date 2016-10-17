%
% Panorama stitching
%
addpath('../Helpers/');
addpath('../Helpers/CalibToolBox');

% load first image and extract corners
img1 = imread('images/image_b2.png');
fprintf('Select the four points A,B,C,D !\n');
pts1=markCorners(img1,4);
close

% load second image and extract corners
img2 = imread('images/image_b1.png');
fprintf('Select the four points A,B,C,D !\n');
pts2=markCorners(img2,4);
close

PanoramaStitching(img1,img2,pts1,pts2);