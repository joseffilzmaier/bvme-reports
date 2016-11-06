function [OutputImage]=undistortImage(cam, InputImage)
% function [OutputImage]=undistortImage(cam, InputImage)
%
% Given the camera undo the lens distortion
% on the image 'InputImage'.
%
% The resulting image will be clipped to the size of the input
% image.
%
% NOTE: this method utilises functions within the Caltech
%       Calibration toolbox
%

%
% $Id: Camera_undoImageDistortion.m,v 1.1 2004/05/10 05:21:39 brandner Exp $
%

OutputImage=[];
A =cam.A;
kr=cam.kr;
kt=cam.kt;
OutputImage=rect(double(InputImage), eye(3),...
				 [A(1,1), A(2,2)]',...
				 A(1:2,3),...
				 [kr(1:2); ...
				  kt(1:2); ...
				  kr(3)]);


