function EntitiesOut = distortVector(cam, EntitiesIn)
%  EntitiesOut = distortVector(cam, EntitiesIn)
%
% Add the lens distortion for the given 2xM vectors.
% The points are in pixel coordinates!
%
% Note: this is only an approximative solution 
%       see sources for details
%
% See also:
%
%


% 
% (c) 2005 by Markus Brandner, brandner@emt.tugraz.at
%
% $Id: apply.m,v 1.1.1.1 2004/10/24 20:34:30 brandner Exp $
%

global geometry;
EntitiesOut=[];

if isa(cam,'Camera')~=1
  error('First parameter must be a valid camera object!');
end

[rows cols]=size(EntitiesIn);
if isa(EntitiesIn,'double')
	
	% sanity
	if (rows~=2)
		error('Parameter must be a 2xN matrix!');
	end
	DebugMessage(geometry,'2D Vector(s) given.');
	
	
	% approximate the distortion ...
	distDash=undistortVector(cam,EntitiesIn); 
	distortion=EntitiesIn-distDash;
	
	EntitiesOut=EntitiesIn+distortion;
	
else
	error('Unknown input datum supplied.');
end
