function [normalized_pts, T] = normalize_points(pts)
centroid = mean(pts,2);
dists = sqrt(sum((pts - repmat(centroid,1,size(pts,2))).^2,1));
mean_dist = mean(dists);
T = [sqrt(2)/mean_dist 0 -sqrt(2)/mean_dist*centroid(1);...
            0 sqrt(2)/mean_dist -sqrt(2)/mean_dist*centroid(2);...
            0 0 1];
normalized_pts = T * pts;