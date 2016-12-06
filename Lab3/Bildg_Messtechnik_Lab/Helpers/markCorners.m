function [corners]=MarkCorners(InputImage, NumberOfCorners)
% [corners]=MarkCorners(InputImage, NumberOfCorners)
%
% Ask the user to select 'NumberOfCorners' corners in the given
% input image.
% The function returns a 2xN matrix holding the 2D coordinates
% of each corner. Where N<=NumberOfCorners.
%

%
% $Id: markCorners.m,v 1.1 2004/05/10 06:21:19 brandner Exp $
%

% cornerfinder spec.
wintx=10;
winty=10;

% off we go ...

myfig=figure;
imshow(InputImage,[]);
title('Select Corners using the RIGHT BUTTON ...');

if size(InputImage,3)>1   % this is a color image -> need to
                          % convert first
	Img=rgb2gray(InputImage);
else
	Img=InputImage;         % no, take the original one
end

cps=1;                    % number of detected corners
corners=[];
while cps<=NumberOfCorners,
  [x, y, ans]=impixel; 
  y=y(1);
  x=x(1);
  
	% now, a corner is said to be valid if 'cornerfinder'
	% is able to detect a proper corner within its m neighbourhood
	[xc,good,bad,type]=cornerfinder([x y]',Img, wintx, winty);
	
	if(good(1) == 1)
		disp('Corner found!');
		corners(:,cps)=xc;
		hold on;
		plot(xc(1,1), xc(2,1), 'r+');
		hold off;
		cps=cps+1;
	else
		disp('Try to hit a valid corner!');
	end
	
end;   
