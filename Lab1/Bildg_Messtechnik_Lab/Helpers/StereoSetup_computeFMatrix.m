function [ResultantSetup]=StereoSetup_computeFMatrix(StereoSetup)
% function [ResultantSetup]=StereoSetup_computeFMatrix(StereoSetup)
%
% For a given stereo setup compute the fundamental matrix. 
%
%

%
% $Id: StereoSetup_computeFMatrix.m,v 1.2 2004/05/11 10:48:41 brandner Exp $
%

% blank copy
ResultantSetup = StereoSetup;

% local copies
R=StereoSetup.R;
T=StereoSetup.T;

% compute skew symmetric matrix
St=[0 -T(3) T(2);...
		T(3) 0  -T(1);...
		-T(2) T(1) 0];

ResultantSetup.FundamentalMatrix = (inv(StereoSetup.RightCamera.A))'*...
		St*R*(inv(StereoSetup.LeftCamera.A));


