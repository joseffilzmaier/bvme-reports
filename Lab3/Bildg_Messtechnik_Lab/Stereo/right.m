% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 836.369189506231580 ; 834.494656734847130 ];

%-- Principal point:
cc = [ 372.261336096807720 ; 234.706645747112160 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.306160104026887 ; 0.458073883794251 ; 0.002189503679816 ; 0.001019619661751 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 6.797560983555004 ; 6.982181936708751 ];

%-- Principal point uncertainty:
cc_error = [ 8.266606216955257 ; 8.288929652439386 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.021263501583052 ; 0.130782374204365 ; 0.001468692991620 ; 0.001839247458143 ; 0.000000000000000 ];

%-- Image size:
nx = 640;
ny = 480;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 21;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -2.160821e+00 ; -2.147088e+00 ; -5.163043e-02 ];
Tc_1  = [ 2.951130e+01 ; -1.243593e+00 ; 1.042384e+03 ];
omc_error_1 = [ 8.822488e-03 ; 1.103492e-02 ; 2.238623e-02 ];
Tc_error_1  = [ 1.030775e+01 ; 1.037053e+01 ; 8.970721e+00 ];

%-- Image #2:
omc_2 = [ 2.238345e+00 ; 2.145629e+00 ; 1.091820e-01 ];
Tc_2  = [ -1.201130e+01 ; -6.490703e+01 ; 1.289640e+03 ];
omc_error_2 = [ 1.476912e-02 ; 1.263496e-02 ; 2.851389e-02 ];
Tc_error_2  = [ 1.275710e+01 ; 1.281319e+01 ; 1.126207e+01 ];

%-- Image #3:
omc_3 = [ 2.038669e+00 ; 1.626373e+00 ; 6.649955e-01 ];
Tc_3  = [ -2.307034e+02 ; -7.411319e+01 ; 1.325852e+03 ];
omc_error_3 = [ 9.835713e-03 ; 7.045813e-03 ; 1.558011e-02 ];
Tc_error_3  = [ 1.305273e+01 ; 1.331096e+01 ; 1.237890e+01 ];

%-- Image #4:
omc_4 = [ -1.709762e+00 ; -2.016059e+00 ; 5.888395e-01 ];
Tc_4  = [ 1.590854e+02 ; -1.255697e+01 ; 1.108560e+03 ];
omc_error_4 = [ 7.251454e-03 ; 7.760241e-03 ; 1.416424e-02 ];
Tc_error_4  = [ 1.110998e+01 ; 1.109709e+01 ; 9.033503e+00 ];

%-- Image #5:
omc_5 = [ -2.081486e+00 ; -2.150802e+00 ; 1.980307e-01 ];
Tc_5  = [ -2.041658e+02 ; -1.020975e+02 ; 1.420849e+03 ];
omc_error_5 = [ 1.069893e-02 ; 9.031143e-03 ; 2.174605e-02 ];
Tc_error_5  = [ 1.400530e+01 ; 1.421452e+01 ; 1.240986e+01 ];

%-- Image #6:
omc_6 = [ -1.348855e+00 ; -1.828639e+00 ; 8.877524e-01 ];
Tc_6  = [ -8.554748e+01 ; -2.481147e+01 ; 1.150823e+03 ];
omc_error_6 = [ 8.783255e-03 ; 8.691086e-03 ; 1.215249e-02 ];
Tc_error_6  = [ 1.135750e+01 ; 1.146423e+01 ; 9.075423e+00 ];

%-- Image #7:
omc_7 = [ -2.012307e+00 ; -2.130427e+00 ; 3.197621e-01 ];
Tc_7  = [ 2.830462e+02 ; -1.685535e+02 ; 1.645252e+03 ];
omc_error_7 = [ 1.889848e-02 ; 2.162448e-02 ; 3.578274e-02 ];
Tc_error_7  = [ 1.661432e+01 ; 1.652932e+01 ; 1.415068e+01 ];

%-- Image #8:
omc_8 = [ -1.805376e+00 ; -1.915196e+00 ; 7.369021e-02 ];
Tc_8  = [ -1.474958e+02 ; -8.665520e+01 ; 7.137021e+02 ];
omc_error_8 = [ 7.942185e-03 ; 7.330607e-03 ; 1.436928e-02 ];
Tc_error_8  = [ 7.027057e+00 ; 7.175543e+00 ; 6.423574e+00 ];

%-- Image #9:
omc_9 = [ -2.554790e+00 ; -1.126771e+00 ; 7.412397e-01 ];
Tc_9  = [ -2.362140e+02 ; 4.158790e+01 ; 9.422838e+02 ];
omc_error_9 = [ 1.062430e-02 ; 4.464923e-03 ; 1.571887e-02 ];
Tc_error_9  = [ 9.348807e+00 ; 9.547566e+00 ; 8.018472e+00 ];

%-- Image #10:
omc_10 = [ 1.880664e+00 ; 7.347844e-01 ; -6.505145e-01 ];
Tc_10  = [ -1.463113e+02 ; 2.332508e+01 ; 8.600931e+02 ];
omc_error_10 = [ 9.774821e-03 ; 7.280345e-03 ; 1.064785e-02 ];
Tc_error_10  = [ 8.506998e+00 ; 8.573948e+00 ; 7.345980e+00 ];

%-- Image #11:
omc_11 = [ 1.891867e+00 ; 7.287580e-01 ; -6.377702e-01 ];
Tc_11  = [ -1.501822e+02 ; 2.502709e+01 ; 8.512196e+02 ];
omc_error_11 = [ 9.762598e-03 ; 7.241173e-03 ; 1.071406e-02 ];
Tc_error_11  = [ 8.420150e+00 ; 8.490818e+00 ; 7.294377e+00 ];

%-- Image #12:
omc_12 = [ -1.044950e+00 ; -2.214746e+00 ; 1.038182e-01 ];
Tc_12  = [ -1.738286e+02 ; -5.709399e+01 ; 8.677614e+02 ];
omc_error_12 = [ 6.882609e-03 ; 9.432977e-03 ; 1.327904e-02 ];
Tc_error_12  = [ 8.558247e+00 ; 8.745345e+00 ; 7.743562e+00 ];

%-- Image #13:
omc_13 = [ -1.652204e+00 ; -1.903752e+00 ; 6.970147e-02 ];
Tc_13  = [ -2.414317e+02 ; -6.587180e+01 ; 6.382793e+02 ];
omc_error_13 = [ 8.421242e-03 ; 7.930541e-03 ; 1.328735e-02 ];
Tc_error_13  = [ 6.305549e+00 ; 6.608533e+00 ; 6.029355e+00 ];

%-- Image #14:
omc_14 = [ -1.711665e+00 ; -1.857817e+00 ; 1.465735e-01 ];
Tc_14  = [ -1.840668e+02 ; -1.140254e+02 ; 7.981804e+02 ];
omc_error_14 = [ 8.375210e-03 ; 7.374237e-03 ; 1.372672e-02 ];
Tc_error_14  = [ 7.870782e+00 ; 8.049858e+00 ; 7.304112e+00 ];

%-- Image #15:
omc_15 = [ -1.656641e+00 ; -1.797923e+00 ; 1.059300e-01 ];
Tc_15  = [ -2.463569e+01 ; -1.460225e+02 ; 9.849749e+02 ];
omc_error_15 = [ 7.310448e-03 ; 7.156156e-03 ; 1.248287e-02 ];
Tc_error_15  = [ 9.771061e+00 ; 9.826631e+00 ; 8.488943e+00 ];

%-- Image #16:
omc_16 = [ -2.246437e+00 ; -1.105285e+00 ; 3.979940e-01 ];
Tc_16  = [ -2.190826e+02 ; -5.047833e+01 ; 1.077511e+03 ];
omc_error_16 = [ 9.988811e-03 ; 5.352023e-03 ; 1.342634e-02 ];
Tc_error_16  = [ 1.062070e+01 ; 1.083409e+01 ; 9.319438e+00 ];

%-- Image #17:
omc_17 = [ -1.959408e+00 ; -2.096792e+00 ; 3.232188e-01 ];
Tc_17  = [ 3.509599e+02 ; -2.988920e+02 ; 2.076596e+03 ];
omc_error_17 = [ 1.767745e-02 ; 1.879212e-02 ; 3.330328e-02 ];
Tc_error_17  = [ 2.107724e+01 ; 2.086846e+01 ; 1.843470e+01 ];

%-- Image #18:
omc_18 = [ 2.121506e+00 ; 1.818524e+00 ; 5.411497e-01 ];
Tc_18  = [ 1.098729e+02 ; -3.207267e+02 ; 2.156049e+03 ];
omc_error_18 = [ 1.006657e-02 ; 8.124985e-03 ; 1.965467e-02 ];
Tc_error_18  = [ 2.159644e+01 ; 2.141929e+01 ; 1.993451e+01 ];

%-- Image #19:
omc_19 = [ -1.510151e+00 ; -1.887353e+00 ; 7.404677e-01 ];
Tc_19  = [ 4.430908e+02 ; -2.579760e+02 ; 1.933987e+03 ];
omc_error_19 = [ 8.644326e-03 ; 8.093373e-03 ; 1.357378e-02 ];
Tc_error_19  = [ 1.985465e+01 ; 1.954843e+01 ; 1.708241e+01 ];

%-- Image #20:
omc_20 = [ 2.048856e+00 ; 1.663937e+00 ; 6.787658e-01 ];
Tc_20  = [ -2.096651e+02 ; -8.510531e+01 ; 1.349101e+03 ];
omc_error_20 = [ 9.846905e-03 ; 7.064788e-03 ; 1.573729e-02 ];
Tc_error_20  = [ 1.328224e+01 ; 1.351828e+01 ; 1.254921e+01 ];

%-- Image #21:
omc_21 = [ -1.682948e+00 ; -1.985972e+00 ; 5.827245e-01 ];
Tc_21  = [ 1.607661e+02 ; -4.248804e+01 ; 1.199858e+03 ];
omc_error_21 = [ 7.353218e-03 ; 7.501436e-03 ; 1.356764e-02 ];
Tc_error_21  = [ 1.199215e+01 ; 1.199661e+01 ; 9.761026e+00 ];

