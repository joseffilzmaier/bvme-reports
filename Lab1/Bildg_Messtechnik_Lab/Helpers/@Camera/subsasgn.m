function cam = subsasgn(cam,index,val)
%SUBSASGN Define assignment for a camera
%
% Possible members to be assigned are:
%
% 'A'
% 'Covariance'
%

%
% $Id: subsasgn.m,v 1.1.1.1 2004/10/24 20:34:30 brandner Exp $
%


[h, w] = size(val);
switch index.type
 case '.'
  switch index.subs
	 case 'A'
		if isnumeric(val) & (w == 3) & (h==3),
      cam.A = val;
			cam.Sigma_aa=zeros(w*h,w*h);
    else 
      error('Invalid datatype assigned!');
    end;  
    return;
	 case 'Label'
		cam.Label = val;
    return;
	 case 'Color'
		cam.Color = val;
    return;
	 case 'SensorSize'
		if isnumeric(val) & (w == 1) & (h==2),
      cam.SensorSize = val;
    else 
      error('Invalid datatype assigned (assuming 2x1 vector)!');
    end;  
    return;
	 case 'kr'
		if isnumeric(val) & (w == 1),
      cam.kr = val;
			cam.Sigma_krkr=zeros(h,h);
    else 
      error('Invalid datatype assigned (assuming nx1 vector)!');
    end;  
    return;
	 case 'kt'
		if isnumeric(val) & (w == 1),
      cam.kt = val;
			cam.Sigma_ktkt=zeros(h,h);
    else 
      error('Invalid datatype assigned (assuming nx1 vector)!');
    end;  
    return;
	 case 'f'
		if isnumeric(val) & (w == 1) & (h==2),
      cam.f = val;
			cam.Sigma_ff=zeros(2,2);			
			disp('ToDo: need to change camera matrix!');
    else 
      error('Invalid datatype assigned (assuming 2x1 vector)!');
    end;  
    return;
	 case 'PixelSize'
		if isnumeric(val) & (w == 1) & (h==1),
      cam.PixelSize = val;
    else 
      error('Invalid datatype assigned (assuming 2x1 vector)!');
    end;  
    return;
	 case 'Sigma_aa'
		if isnumeric(val) & (w == 9) & (h==9),
      cam.Sigma_aa = val;
    else 
      error('Invalid datatype assigned!');
    end;  
    return;
	 case 'Sigma_krkr'
		if isnumeric(val) & (isCovarianceMatrix(val,size(cam.kr,1))>0)
      cam.Sigma_krkr = val;
    else 
      error('Invalid datatype assigned!');
    end;  
    return;
	 case 'Sigma_ktkt'
		if isnumeric(val) & (isCovarianceMatrix(val,size(cam.kt,1))>0)
      cam.Sigma_ktkt = val;
    else 
      error('Invalid datatype assigned!');
    end;  
    return;
	 case 'Sigma_ff'
		if isnumeric(val) & (isCovarianceMatrix(val,size(cam.f,1))>0)
      cam.Sigma_ff = val;
    else 
      error('Invalid datatype assigned!');
    end;  
    return;
	 otherwise
    error('Invalid field name');
  end
 otherwise
  error('Invalid field name')  
end
