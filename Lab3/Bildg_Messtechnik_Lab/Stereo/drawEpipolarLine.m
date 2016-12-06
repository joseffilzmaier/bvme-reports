function [e_left, e_right] = drawEpipolarLine(F, p_left, p_right)
% drawEpipolarLine(F, p_left, p_right)
%
% For every point in p_left (2xn Matrix), the
% point is drawn in figure(1) (left image) and the
% corresponding epipolar line is drawn in figure(2)
% (right image). 
% The same is done for every point in p_right.
%

%
% $Id: drawEpipolarLine.m,v 1.2 2004/05/10 14:54:19 brandner Exp $
%

left_figure=1;
right_figure=2;
xmin=-20000;
xmax=20000;

N = size(p_right,2);

colors = hsv(N);
e_left = zeros(3, N);
e_right = zeros(3, N);


% for every point in the right image
for i=1:1:N

	figure(right_figure);
	hold on;
	plot(p_right(1,i), p_right(2,i), '+', 'Color', colors(i,:));
	hold off;
	
	
	figure(left_figure);    % left image
	hold on;

	%TODO: plot the epipolar lines

    
	hold off;
end


% for every point in the left image
for i=1:1:N
	figure(left_figure);
	hold on;
	plot(p_left(1,i), p_left(2,i), '+', 'Color', colors(i,:));
	hold off;
	
	figure(right_figure);    % right image
	hold on;

	%TODO: plot the epipolar lines
    
	
	hold off;
end
