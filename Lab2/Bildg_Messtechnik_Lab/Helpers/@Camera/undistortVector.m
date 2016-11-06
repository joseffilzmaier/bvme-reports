function EntitiesOut = undistortVector(cam, EntitiesIn)
%  EntitiesOut = undistortVector(cam, EntitiesIn)
%
% Undo the lens distortion for the given 2xM vectors.
% The points are in pixel coordinates!
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
	
	N=cols;
	A=cam.A;
	invA=A^-1;
	for i=1:N
		
		% assume Euclidean points in 2D
		pnh=invA*[EntitiesIn(:,i); 1];
		pn=pnh(1:2)/pnh(3);
		
		r2=pn(1)^2+pn(2)^2;
		kr=cam.kr; kt=cam.kt;
		Sigma_krkr=cam.Sigma_krkr; Sigma_ktkt=cam.Sigma_ktkt;
	
		delta_radial=(kr(1)*r2+kr(2)*r2^2+kr(3)*r2^3)*pn;
		delta_tangential=[2*pn(1)*pn(2)*kt(1)+(2*pn(1)^2+r2)*kt(2);...
											2*pn(1)*pn(2)*kt(2)+(r2+2*pn(2)^2)*kt(1)];
	
		delta=delta_radial+delta_tangential;
		
		%
		% wrong sign corrected! MB 02/2006
		%
		pd=pn-delta_radial-delta_tangential;
	
		% affine trafo to pixel coordinates
		p=A*[pd;1];
		
		EntitiesOut=[EntitiesOut p(1:2)];	
	end
else
	error('Unknown input datum supplied.');
end
