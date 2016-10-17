function display(cam)
% CAMERA display method

%
% $Id: display.m,v 1.2 2006/05/28 17:20:45 brandner Exp $
%
disp(' ');
disp(['Camera ',inputname(1),' = '])
disp(' ');
disp([' Label                 : ',cam.Label]);
disp([' Color                 : ',cam.Color]);
disp([' PixelSize         [m] :',sprintf(' %6.4e', cam.PixelSize)]);   
disp([' f                 [m] :',sprintf(' %6.4e', cam.f)]);
disp([' SensorSize    [pixel] :',...
			sprintf(' %d x %d', cam.SensorSize(1), cam.SensorSize(2))]);   
disp([' kr                [1] :',sprintf(' %6.4e', cam.kr)]);

disp([' kt                [1] :',sprintf(' %6.4e', cam.kt)]);

disp([' A                     :',sprintf(' %6.4f', cam.A(1,:))]);   
disp(['                        ',sprintf(' %6.4f', cam.A(2,:))]);   
disp(['                        ',sprintf(' %6.4f', cam.A(3,:))]); 

disp(' ');

disp([' Sigma_ff        [m^2] :',sprintf(' %6.4e', cam.Sigma_ff(1,:))]);
disp(['                        ',sprintf(' %6.4e', cam.Sigma_ff(2,:))]);
disp([' Sigma_krkr        [1] :',sprintf(' %6.4e', cam.Sigma_krkr(1,:))]);
for i=2:size(cam.kr,1)
	disp(['                        ',sprintf(' %6.4e', cam.Sigma_krkr(i,:))]);
end
disp([' Sigma_ktkt        [1] :',sprintf(' %6.4e', cam.Sigma_ktkt(1,:))]);
for i=2:size(cam.kt,1)
	disp(['                        ',sprintf(' %6.4e', cam.Sigma_ktkt(i,:))]);
end

disp([' Sigma_aa              :',sprintf(' %6.4f', cam.Sigma_aa(1,:))]);   
disp(['                        ',sprintf(' %6.4f', cam.Sigma_aa(2,:))]);   
disp(['                        ',sprintf(' %6.4f', cam.Sigma_aa(3,:))]);   
disp(['                        ',sprintf(' %6.4f', cam.Sigma_aa(4,:))]);   
disp(['                        ',sprintf(' %6.4f', cam.Sigma_aa(5,:))]);   
disp(['                        ',sprintf(' %6.4f', cam.Sigma_aa(6,:))]);   
disp(['                        ',sprintf(' %6.4f', cam.Sigma_aa(7,:))]);   
disp(['                        ',sprintf(' %6.4f', cam.Sigma_aa(8,:))]);   
disp(['                        ',sprintf(' %6.4f', cam.Sigma_aa(9,:))]);   
disp(' ');
