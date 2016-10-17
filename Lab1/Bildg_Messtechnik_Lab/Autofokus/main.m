%
% Autofocus
%

N = 1000;

% directory that contains the image sequence
img_dir = 'images';
% type of the image (e.g. jpg)
img_type = '.png';
img_names = dir([img_dir '/*' img_type]);

%%
% name of the first image
%img_name = img_names(1).name;

imshowD = @(img) imshow(im2uint8(img));
focVal = [];
focName = [];

for i = 1:length(img_names)
    img_name = img_names(i).name;
    img = imread([img_dir '/' img_name]);
    imgG = rgb2gray(img);
    imgG = im2double(imgG);
    
    %figure('name',img_name);
    %subplot(2,2,1);
    %imshowD(imgG)
    %subplot(2,2,2);
    [grd,~] = imgradient(imgG,'CentralDifference');
    %imshowD(grd / max(grd(1:end)));
    
    %subplot(2,2,3);
    %hist(grd(1:end),0:0.01:1);
    
    grdS = sort(grd,'descend');
    
    focusInd = sum(grdS(1:N)) / N;
    fprintf('%s - %d\n', img_name, focusInd);
    
    focVal = [focVal, focusInd];
end

%%
focNames = {};
for i = 1:length(img_names)
    n = img_names(i).name;
    focNames{i} = n(7:end-4);
end

%%
plot(focVal);
set(gca,'XLim',[1 length(focNames)],'XTick',1:length(focNames),'XTickLabel',focNames)