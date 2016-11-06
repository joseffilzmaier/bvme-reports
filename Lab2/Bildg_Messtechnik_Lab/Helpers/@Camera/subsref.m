function out = subsref(cam,index)
%SUBSREF Define field name referencing for Camera classes
%
% Possible fields to reference: see display output
%

%
% $Id: subsref.m,v 1.1.1.1 2004/10/24 20:34:30 brandner Exp $
%

switch index.type
 case '.'
	switch index.subs
	 case 'Label'
		out = cam.Label;
		return;
	 case 'f'
		out = cam.f;
		return;
	 case 'Sigma_ff'
		out = cam.Sigma_ff;
		return;
	 case 'A'
		out=cam.A;
    return;
	 case 'Sigma_aa'
    out=cam.Sigma_aa;  
		return;
	 case 'kr'
    out = cam.kr;
    return;
	 case 'Sigma_krkr'
    out = cam.Sigma_krkr;
    return;
	 case 'kt'
    out = cam.kt;
    return;
	 case 'Sigma_ktkt'
    out = cam.Sigma_ktkt;
    return;
	 case 'PixelSize'
    out = cam.PixelSize;
    return;
	 case 'SensorSize'
    out = cam.SensorSize;
    return;
	 otherwise
    error('Invalid field name');
  end
 otherwise
  error('Invalid field name')  
end
