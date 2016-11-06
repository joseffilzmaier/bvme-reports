clear all
close all
clc

%% Bild mit natürlichem Licht

img = imread('pictures/bild_ohne.png');
subplot(2,2,1);
imshow(img);
title('original');

% WhitePatchRetinex
wpr = whitePatchRetinex(img);

subplot(2,2,2);
imshow(wpr);
title('whitePatch');

% WhitePatchRetinexHist
wpr_h = whitePatchRetinexHist(img);

subplot(2,2,3);
imshow(wpr_h);
title('whitePatchMax');

% Gray World
grwrld = grayWorld(img);

subplot(2,2,4);
imshow(grwrld);
title('Gray World');


%% Bild mit Baustrahler

img = imread('pictures/bild_strahler.png');
subplot(2,2,1);
imshow(img);
title('original');

% WhitePatchRetinex
wpr = whitePatchRetinex(img);

subplot(2,2,2);
imshow(wpr);
title('whitePatch');

% WhitePatchRetinexHist
wpr_h = whitePatchRetinexHist(img);

subplot(2,2,3);
imshow(wpr_h);
title('whitePatchMax');

% Gray World
grwrld = grayWorld(img);

subplot(2,2,4);
imshow(grwrld);
title('Gray World');


%% Bild mit LED-Beleuchtung

img = imread('pictures/bild_led.png');
subplot(2,2,1);
imshow(img);
title('original');

% WhitePatchRetinex
wpr = whitePatchRetinex(img);

subplot(2,2,2);
imshow(wpr);
title('whitePatch');

% WhitePatchRetinexHist
wpr_h = whitePatchRetinexHist(img);

subplot(2,2,3);
imshow(wpr_h);
title('whitePatchMax');

% Gray World
grwrld = grayWorld(img);

subplot(2,2,4);
imshow(grwrld);
title('Gray World');
