function [pt3D]=StereoSetup_reconstruct3D(StereoSetup, pLeft, pRight)
% function [pt3D]=StereoSetup_reconstruct3D(StereoSetup, pLeft, pRight) 
%
% Based on the provided 'StereoSetup' and a corresponding list of 
% left and right image points, compute the resultant points in 3D
% using a robust SVD based method.
%

%
% $Id: StereoSetup_reconstruct3D.m,v 1.1 2004/05/10 06:35:11 brandner Exp $
%

% we compute projection matrices
Mleft = [eye(3,3) [0 0 0]'];    % trafo
Pleft = StereoSetup.LeftCamera.A*Mleft;

Mright= [StereoSetup.R StereoSetup.T];
Pright= StereoSetup.RightCamera.A*Mright;

if size(pLeft) ~= size(pRight)
	error('Left an right point list must have the same size!');
end

N=size(pLeft,2);
pt3D=zeros(3,N);

for i=1:1:N
	
	ptl=pLeft(:,i);
	ptr=pRight(:,i);
	
	% determine the robust solution
	B=[Pleft(1,:) - ptl(1)*Pleft(3,:);...
		 Pleft(2,:) - ptl(2)*Pleft(3,:);...
		 Pright(1,:) - ptr(1)*Pright(3,:);...
		 Pright(2,:) - ptr(2)*Pright(3,:)];
	
	[U,S,V] = svd(B'*B);
	max_values = max(abs(S),[],1);
	[order,indices] = sort(max_values,2);
	sol = V(:,indices(1));

	% store the result
	pt3D(:,i) = sol(1:3)/sol(4);
end

