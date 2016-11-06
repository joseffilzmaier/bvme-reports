function [StereoSystem]=StereoSetup_readFromCalibData(filename, LeftPixelSize, RightPixelSize)
% function [StereoSystem]=StereoSetup_readFromCalibData(filename, LeftPixelSize, RightPixelSize)
%
% Construct a stereo setup provided the calibration file 'filename'
% and the left and right pixel sizes, respectively.
%
% NOTE: the convetion of the calibration file is closely related to
% the Caltech Calibration Toolbox.
%

%
% $Id: StereoSetup_readFromCalibData.m,v 1.1 2004/05/10 05:29:44 brandner Exp $
%

% read the calibration data (.mat file!)
load(filename);

% extract the left camera parameters
fc=fc_left;
fc_error=fc_left_error;
alpha_c=alpha_c_left;
alpha_c_error=alpha_c_left_error;
cc=cc_left;
cc_error=cc_left_error;
kc=kc_left;
kc_error=kc_left_error;

save 'left.mat' fc fc_error alpha_c alpha_c_error cc cc_error kc ...
		kc_error nx ny;

CLeft=Camera('left.mat',LeftPixelSize);
A_left=CLeft.A;
f_left=CLeft.f;


% extract the right camera parameters
fc=fc_right;
fc_error=fc_right_error;
alpha_c=alpha_c_right;
alpha_c_error=alpha_c_right_error;
cc=cc_right;
cc_error=cc_right_error;
kc=kc_right;
kc_error=kc_right_error;

save 'right.mat' fc fc_error alpha_c alpha_c_error cc cc_error kc ...
		kc_error nx ny;

CRight=Camera('right.mat',RightPixelSize);
A_right=CRight.A;
f_right=CRight.f;

% compute the fundamental matrix
F=[];

StereoSystem = struct('LeftCamera',CLeft,...
											'RightCamera',CRight,...
											'R',R,...
											'T',T/1000,...
											'FundamentalMatrix',F,...
											'Label','DefaultStereo');
