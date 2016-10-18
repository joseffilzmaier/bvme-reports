function [cr]=CrossRatio(points)
% function [cr]=CrossRatio(points) 
%
% Determine the cross ratio of 4 points in 2D,
% where 'points' is a 2x4 matrix.
%

A = points(1:2,1);
B = points(1:2,2);
C = points(1:2,3);
D = points(1:2,4);

d = @(a,b) sqrt( (a(1)-b(1))^2 + (a(2)-b(2))^2);

cr = d(A,C) / d(B,C) * d(B,D) / d(A,D);
