function [] = main()

clear all
close all
clc

%% bild unbeleuchtet
img = imread('pictures/bild_ohne.png');
show_channels(img, img, ['R' 'G' 'B']);

imgHsv = rgb2hsv(img);
show_channels(img, imgHsv, ['H' 'S' 'V']);

imgLab = rgb2lab(img);
show_channels(img, imgLab, ['L' 'a' 'b']);

imgXyz = rgb2xyz(img);
show_channels(img, imgXyz, ['X' 'Y' 'Z']);

%% bild mit LED-Beleuchtung
img = imread('pictures/bild_led.png');
show_channels(img, img, ['R' 'G' 'B']);

imgHsv = rgb2hsv(img);
show_channels(img, imgHsv, ['H' 'S' 'V']);

imgLab = rgb2lab(img);
show_channels(img, imgLab, ['L' 'a' 'b']);

imgXyz = rgb2xyz(img);
show_channels(img, imgXyz, ['X' 'Y' 'Z']);

%% bild mit Baustrahler (Halogen)
img = imread('pictures/bild_strahler.png');
show_channels(img, img, ['R' 'G' 'B']);

imgHsv = rgb2hsv(img);
show_channels(img, imgHsv, ['H' 'S' 'V']);

imgLab = rgb2lab(img);
show_channels(img, imgLab, ['L' 'a' 'b']);

imgXyz = rgb2xyz(img);
show_channels(img, imgXyz, ['X' 'Y' 'Z']);

end


function [] = show_channels(im0, img, titles)
figure;


subplot(2,2,1);
imshow(im0);
title('original');

subplot(2,2,2);
imshow(img(:,:,1));
title(titles(1));

subplot(2,2,3);
imshow(img(:,:,2));
title(titles(2));

subplot(2,2,4);
imshow(img(:,:,3));
title(titles(3));

end

function imgLab = rgb2lab(img)
    C = makecform('srgb2lab');
    imgLab = applycform(img, C);
end

function imgXyz = rgb2xyz(img)
    C = makecform('srgb2xyz');
    imgXyz = applycform(img, C);
end