function [ a_rgb ] = grayValueCurveFitting( gray_img, gray_target, img )
%GRAYVALUECURVEFITTING Summary of this function goes here
%   Detailed explanation goes here
observedRed = flipud(gray_img(:,1));   chartRed = flipud(gray_target(:,1));
observedGreen = flipud(gray_img(:,2)); chartGreen = flipud(gray_target(:,2));
observedBlue = flipud(gray_img(:,3));  chartBlue = flipud(gray_target(:,3));

% method = 'splineinterp';
method = 'pchipinterp';
redOut = fit(observedRed, chartRed, method);
greenOut = fit(observedGreen, chartGreen, method);
blueOut = fit(observedBlue, chartBlue, method);

redCurve = uint8(redOut(1:observedRed(end)));       redCurve(end+1:256) = redOut(observedRed(end));
greenCurve = uint8(greenOut(1:observedGreen(end))); greenCurve(end+1:256) = greenOut(observedGreen(end));
blueCurve = uint8(blueOut(1:observedBlue(end)));    blueCurve(end+1:256) = blueOut(observedBlue(end));

figure;
subplot(1,3,1), plot(redCurve,'r'), grid on, axis([0 260 0 260]); xlabel('observed values'); ylabel('target values');
hold on; plot(observedRed,chartRed,'xk'); hold off;
subplot(1,3,2), plot(greenCurve,'g'), grid on, axis([0 260 0 260]); xlabel('observed values'); ylabel('target values');
hold on; plot(observedGreen,chartGreen,'xk'); hold off;
subplot(1,3,3), plot(blueCurve,'b'), grid on, axis([0 260 0 260]); xlabel('observed values'); ylabel('target values');
hold on; plot(observedBlue,chartBlue,'xk'); hold off;

ar = intlut(img(:,:,1), redCurve);
ag = intlut(img(:,:,2), greenCurve);
ab = intlut(img(:,:,3), blueCurve);
a_rgb = cat(3, uint8(ar), uint8(ag), uint8(ab));

end

