function newcam = Camera(varargin)
% CAMERA Camera class constructor
%
% Construct a camera class representing a perspective camera
% based on a pinhole camera with radial and tangential distortion.
% For a detailed description see my thesis.
%
% Parameters are:
%
% [cam]=Camera(c)
%       Copy constructor 
%
% [cam]=Camera
%       Return a normalized camera in 3D without lens distortion.
%
% [cam]=Camera(CalibFile, PixelSize)
%       Read the camera parameters from file 'CalibFile' and
%       use 'PixelSize' (which is not given in 'CalibFile') to
%       initialize a camera in neutral pose. Note that the format
%       of the calibibration data file is specified by the 
%       Caltech Calibration Toolbox.
%
% [cam]=Camera(XMLFile)
%       Read the camera parameters from a HT compliant XML file.
%
%
% Parameters of the camera model are:
%
% A ............. projection matrix, affine (3x3)
% Sigma_aa ...... covariance matrix of the vector vec(A^T)
% kr ............ radial distortion vector
% Sigma_krkr .... covariance matrix of the rad. distortion vector
% kt ............ tangential distortion vector
% Sigma_ktkt .... covariance matrix of the tan. distortion vector
% PixelSize ..... size of a single pixel [m]
% f ............. focal length vector [m]
% Sigma_ff ...... covariance matrix of the focal length vector
% SensorSize .... width and height of the sensor [pixel]
% Label ......... label (alpha-numeric) of the camera
% Color ......... color of the camera (used to visualize the sensor)
%
%
% See also: Geometry
%

%
% (c) 2005 by Markus Brandner, brandner@emt.tugraz.at
%
% $Id: Camera.m,v 1.2 2006/05/28 17:20:45 brandner Exp $
%

% globals
global geometry;

% some defaults
cam=[];
mA=eye(3);                 % projection matrix
mSigma_aa=zeros(9,9);       % covariance
mkr=zeros(3,1);                      % rad. distortion
mSigma_krkr=zeros(3,3);
mkt=zeros(2,1);                      % tang. distortion
mSigma_ktkt=zeros(2,2);
mPixelSize=1;               
mf=[1,1]';                  % focal lengths
mSigma_ff=zeros(2,2);
mSensorSize=[1,1]';
mLabel='Pinhole';
mColor='b';
mValid=0;

switch nargin
 case 0             % no argument given -> normalized pinhole.
	mValid=1; 
 case 1             % copy constructor call, XML File
	if isa(varargin{1},'Camera')
		disp('Camera - copy constructor call');
	else
		disp('XML read constructor still needs some attention ... ');
		newcam=Camera;   % default construction
		newcam=read(newcam,varargin{1});   % read from xml file
	end
 case 2
	% additional parameters given -> try to read the camera
	mLabel=varargin{1};
	mPixelSize=varargin{2};

	% sanity
	if ischar(mLabel) ~=1
		error('Calib filename not a string.');
	end
	if isnumeric(mPixelSize)~=1
		error('PixelSize not numeric.');
	end
	
	% read the file
	if length(strfind(mLabel,'.mat'))>0
		%% disp('Matlab workspace given.');
		eval(sprintf('load %s',mLabel));
	else
		eval(mLabel);
	end
	
	mA=[fc(1) alpha_c*fc(1) cc(1) ; ...
			0.0   fc(2)         cc(2) ; ...
			0.0   0.0           1.0  ];	


	% compute the uncertainties based on the results of Bouguet	
	fc_variances=(fc_error/3).^2;           
	tempSigma_aa=zeros(9,9);tempSigma_krkr=zeros(3,3);
	tempSigma_ktkt=zeros(2,2);tempSigma_ff=zeros(2,2);
	
	tempSigma_aa(1,1)=fc_variances(1);
	tempSigma_aa(5,5)=fc_variances(2);
	
	% combine uncertain alpha_c and fc(1)
	tempSigma_aa(2,2)=...
			alpha_c^2*fc_variances(1)+...
			fc(1)^2*(alpha_c_error/3)^2;
	
	% image center 
	cc_variances=(cc_error/3).^2;
	tempSigma_aa(3,3)=cc_variances(1);
	tempSigma_aa(6,6)=cc_variances(2);
	
	tempSigma_ff=diag(mPixelSize^2*fc_variances);	
	tempSigma_krkr=diag(([kc_error(1); kc_error(2); kc_error(5)]/3).^2);
	tempSigma_ktkt=diag(([kc_error(3); kc_error(4)]/3).^2);

	if exist(sprintf('%s.mat',mLabel))		
		eval(sprintf('load %s',mLabel));
	end

	if exist('Sigma_aa')==1 & Sigma_aa(1,1)~=NaN
		fprintf(1,'Brandner patch: Full covariances found -> use it !\n');
		mSigma_aa=Sigma_aa;
		mSigma_krkr=Sigma_krkr;
		mSigma_ktkt=Sigma_ktkt;
		mSigma_ff=Sigma_ff;
		
		%
		% just for debugging ...
		%
		if 1==0
			fprintf(1,'\nFor your reference the difference from Bouguet covariances would be:\n');
			dSigma_aa=mSigma_aa-tempSigma_aa
			dSigma_krkr=mSigma_krkr-tempSigma_krkr
			dSigma_ktkt=mSigma_ktkt-tempSigma_ktkt
			dSigma_ff=mSigma_ff-tempSigma_ff
		end
	else
		mSigma_aa=tempSigma_aa;
		mSigma_krkr=tempSigma_krkr;
		mSigma_ktkt=tempSigma_ktkt;
		mSigma_ff=tempSigma_ff;
	end

	% focal length
	mf=fc*mPixelSize;
	
	% distortion
	mkr=[kc(1); kc(2); kc(5)];
	mkt=[kc(3); kc(4)];
	
	mSensorSize=[nx,ny]';
	
	mValid=1;
 otherwise
	error('Illegal number of parameters supplied.');
end

if mValid==1
	cam=struct('A',mA,...
						 'Sigma_aa',mSigma_aa,...
						 'kr', mkr, ...
						 'Sigma_krkr',mSigma_krkr,...
						 'kt', mkt, ...
						 'Sigma_ktkt',mSigma_ktkt,...
						 'PixelSize', mPixelSize,...
						 'f',mf,...
						 'Sigma_ff', mSigma_ff,...
						 'Label', mLabel,...
						 'Color', mColor,...
						 'SensorSize',mSensorSize);
end

newcam=class(cam,'Camera');