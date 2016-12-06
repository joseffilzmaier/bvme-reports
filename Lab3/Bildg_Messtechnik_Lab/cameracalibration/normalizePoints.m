function [ pt_n, T ] = normalizePoints( pt )
%NORMALIZEPOINTS normalize 2D or 3D points so that their mean over their
% coordinate axes is zero and their standard deviation is approximatelly
% sqrt(2).
% IN:   pt      - homogenouse points; e.g.: (3xN) for the case of 2D points
%                 or (4xN) for the case of 3D points.
%
% OUT:  pt_n    - normalized points
%       T       - Transformation matrix, which normalizes the points

if size(pt,1) == 3
    mean_i = mean(pt,2);
    T_m = [1 0 -mean_i(1)
         0 1 -mean_i(2)
         0 0 1];
    pt_ = T_m*pt; % pt_i_ = pt_i_ ./ repmat(pt_i_(3,:),3,1);
    std_i = std(pt_,0,2);
    s = sqrt(2)/((std_i(1)+std_i(2))/2);

    T_s = [s 0 0
           0 s 0
           0 0 1];
    T = T_s * T_m;
    pt_n = T * pt;
elseif size(pt,1) == 4
    mean_i = mean(pt,2);
    T_m = [1 0 0 -mean_i(1)
         0 1 0 -mean_i(2)
         0 0 1 -mean_i(3)
         0 0 0 1];
    pt_ = T_m*pt; % pt_i_ = pt_i_ ./ repmat(pt_i_(3,:),3,1);
    std_i = std(pt_,0,2);
    s = sqrt(2)/((std_i(1)+std_i(2)+std_i(3))/3);

    T_s = [s 0 0 0
           0 s 0 0
           0 0 s 0
           0 0 0 1];
    T = T_s * T_m;
    pt_n = T * pt;
else
    pt_n = NaN;
    T = NaN;
end


end

