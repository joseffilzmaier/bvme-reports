%
% Cross Ratio Test
% 
addpath('../Helpers/');
addpath('../Helpers/CalibToolBox');

% load image and extract cornsers:
%img = imread('images/image_a1.png');
%fprintf('Select the four points A,B,C,D !\n');
%pts=markCorners(img,4);

%cr=CrossRatio(pts);

%%
img_dir = 'images';
% type of the image (e.g. jpg)
img_type = '.png';
img_names = dir([img_dir '/*' img_type]);

N = length(img_names);
crS = zeros(1,N);

for i=1:N
    img_name = img_names(i).name;
    img = imread([img_dir '/' img_name]);
    fprintf('Select the four points A,B,C,D !\n');
    pts=markCorners(img,4);
    close
    cr=CrossRatio(pts);
    
    fprintf('%s - %d\n', img_name, cr);
    crS(i) = cr;
end

%%
crSavg = mean(crS)
crSstd = std(crS)