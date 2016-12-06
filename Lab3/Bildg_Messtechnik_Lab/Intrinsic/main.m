close all;
clear all;
clc;

addpath('../Helpers/');
addpath('../Helpers/CalibToolBox/');

% TODO: calibrate camera using calib_gui


% TODO: undistort images using script "undistort_image"

%read in disorted and undistorted images
img1 = im2double(imread('img_1.bmp'));
img2 = im2double(imread('img_2.bmp'));
img1_rect = im2double(imread('img_1_rect.bmp'));
img2_rect = im2double(imread('img_2_rect.bmp'));

num_correspondences = 4;

%TODO: Perform stitching for distorted and undistorted images and discuss
%your results.
ptr_img1 = [];
ptr_img2 = [];
PanoramaStitching(img1, img2, ptr_img1, ptr_img2);