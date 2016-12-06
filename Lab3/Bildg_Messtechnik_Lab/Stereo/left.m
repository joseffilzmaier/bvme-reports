% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 828.563654569942060 ; 830.604643654978990 ];

%-- Principal point:
cc = [ 346.104058610839050 ; 247.311995705102670 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.282699998733331 ; 0.326078438991977 ; 0.001834258020962 ; 0.001963489072897 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 5.462285765422842 ; 5.740678139674642 ];

%-- Principal point uncertainty:
cc_error = [ 6.659463588275354 ; 7.386413954301847 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.018646609302357 ; 0.121569083941356 ; 0.001364318018424 ; 0.001370690637315 ; 0.000000000000000 ];

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
omc_1 = [ 2.210194e+00 ; 1.574631e+00 ; 6.921783e-01 ];
Tc_1  = [ 2.806939e+01 ; -7.630843e+01 ; 1.028717e+03 ];
omc_error_1 = [ 9.074021e-03 ; 4.315376e-03 ; 1.181601e-02 ];
Tc_error_1  = [ 8.262329e+00 ; 9.137985e+00 ; 7.480487e+00 ];

%-- Image #2:
omc_2 = [ 2.147605e+00 ; 1.425887e+00 ; 6.860010e-01 ];
Tc_2  = [ -1.644976e+02 ; -9.899511e+01 ; 1.196126e+03 ];
omc_error_2 = [ 8.572882e-03 ; 4.500126e-03 ; 1.093401e-02 ];
Tc_error_2  = [ 9.778680e+00 ; 1.069029e+01 ; 8.782647e+00 ];

%-- Image #3:
omc_3 = [ 1.786487e+00 ; 8.871027e-01 ; 1.037478e+00 ];
Tc_3  = [ -3.508719e+02 ; -3.531685e+01 ; 1.091642e+03 ];
omc_error_3 = [ 9.371526e-03 ; 5.289459e-03 ; 8.271750e-03 ];
Tc_error_3  = [ 9.226600e+00 ; 1.000002e+01 ; 8.737643e+00 ];

%-- Image #4:
omc_4 = [ -2.367957e+00 ; -1.990157e+00 ; -1.057961e-01 ];
Tc_4  = [ 8.382921e+01 ; -1.214693e+02 ; 1.154931e+03 ];
omc_error_4 = [ 9.869980e-03 ; 1.004999e-02 ; 2.039879e-02 ];
Tc_error_4  = [ 9.266756e+00 ; 1.028681e+01 ; 8.391485e+00 ];

%-- Image #5:
omc_5 = [ 2.289975e+00 ; 1.672760e+00 ; 4.667624e-01 ];
Tc_5  = [ -3.945988e+02 ; -6.068623e+01 ; 1.181779e+03 ];
omc_error_5 = [ 1.091825e-02 ; 8.695926e-03 ; 1.868962e-02 ];
Tc_error_5  = [ 1.009258e+01 ; 1.085214e+01 ; 9.118624e+00 ];

%-- Image #6:
omc_6 = [ -2.035539e+00 ; -1.942435e+00 ; 2.709849e-01 ];
Tc_6  = [ -1.275430e+02 ; -5.153248e+01 ; 1.043929e+03 ];
omc_error_6 = [ 8.649175e-03 ; 6.850058e-03 ; 1.367594e-02 ];
Tc_error_6  = [ 8.449675e+00 ; 9.313371e+00 ; 6.825676e+00 ];

%-- Image #7:
omc_7 = [ 2.308965e+00 ; 1.731559e+00 ; 4.185452e-01 ];
Tc_7  = [ -1.777795e+02 ; -2.549114e+02 ; 1.641912e+03 ];
omc_error_7 = [ 9.498982e-03 ; 6.901230e-03 ; 1.667119e-02 ];
Tc_error_7  = [ 1.344401e+01 ; 1.466106e+01 ; 1.221666e+01 ];

%-- Image #8:
omc_8 = [ -2.313373e+00 ; -1.931501e+00 ; -7.081185e-01 ];
Tc_8  = [ 5.720765e+01 ; -1.332151e+02 ; 6.473386e+02 ];
omc_error_8 = [ 4.592443e-03 ; 8.759342e-03 ; 1.266885e-02 ];
Tc_error_8  = [ 5.236051e+00 ; 5.785090e+00 ; 4.835465e+00 ];

%-- Image #9:
omc_9 = [ -2.954658e+00 ; -7.752740e-01 ; -1.864247e-01 ];
Tc_9  = [ -1.014724e+02 ; 3.867260e+01 ; 7.950472e+02 ];
omc_error_9 = [ 1.014602e-02 ; 3.647935e-03 ; 1.398284e-02 ];
Tc_error_9  = [ 6.424348e+00 ; 7.066908e+00 ; 5.615765e+00 ];

%-- Image #10:
omc_10 = [ 2.069343e+00 ; -3.735997e-03 ; -2.169607e-01 ];
Tc_10  = [ 9.462704e+00 ; -1.595952e+01 ; 7.773524e+02 ];
omc_error_10 = [ 9.143721e-03 ; 5.362740e-03 ; 8.894360e-03 ];
Tc_error_10  = [ 6.255093e+00 ; 6.919988e+00 ; 5.085880e+00 ];

%-- Image #11:
omc_11 = [ 2.074637e+00 ; -1.030701e-02 ; -2.009183e-01 ];
Tc_11  = [ 1.215565e+01 ; -1.396454e+01 ; 7.680753e+02 ];
omc_error_11 = [ 9.150648e-03 ; 5.332754e-03 ; 8.923877e-03 ];
Tc_error_11  = [ 6.180921e+00 ; 6.836058e+00 ; 5.032608e+00 ];

%-- Image #12:
omc_12 = [ -2.384771e+00 ; 1.523311e+00 ; 1.772902e-01 ];
Tc_12  = [ -2.469199e+00 ; 1.710849e+02 ; 8.433390e+02 ];
omc_error_12 = [ 7.416714e-03 ; 5.884319e-03 ; 1.253968e-02 ];
Tc_error_12  = [ 6.827232e+00 ; 7.453843e+00 ; 5.813838e+00 ];

%-- Image #13:
omc_13 = [ -2.152400e+00 ; -1.992611e+00 ; -6.878535e-01 ];
Tc_13  = [ 3.668232e+01 ; -9.108298e+01 ; 5.330230e+02 ];
omc_error_13 = [ 4.289471e-03 ; 8.641015e-03 ; 1.238363e-02 ];
Tc_error_13  = [ 4.298971e+00 ; 4.767731e+00 ; 3.822211e+00 ];

%-- Image #14:
omc_14 = [ -2.212229e+00 ; -1.916106e+00 ; -6.171150e-01 ];
Tc_14  = [ -2.685877e+01 ; -1.384294e+02 ; 6.892204e+02 ];
omc_error_14 = [ 5.025889e-03 ; 7.441729e-03 ; 1.175319e-02 ];
Tc_error_14  = [ 5.605760e+00 ; 6.200886e+00 ; 4.840133e+00 ];

%-- Image #15:
omc_15 = [ -2.120633e+00 ; -1.890398e+00 ; -6.500896e-01 ];
Tc_15  = [ -2.439338e+01 ; -2.012878e+02 ; 9.298087e+02 ];
omc_error_15 = [ 5.307346e-03 ; 7.409147e-03 ; 1.167205e-02 ];
Tc_error_15  = [ 7.582720e+00 ; 8.433368e+00 ; 6.527963e+00 ];

%-- Image #16:
omc_16 = [ -2.565184e+00 ; -9.628065e-01 ; -5.034771e-01 ];
Tc_16  = [ -1.930856e+02 ; -4.038457e+01 ; 9.005810e+02 ];
omc_error_16 = [ 7.959683e-03 ; 4.646764e-03 ; 1.092333e-02 ];
Tc_error_16  = [ 7.291783e+00 ; 8.123329e+00 ; 6.373577e+00 ];

%-- Image #17:
omc_17 = [ 2.334308e+00 ; 1.795522e+00 ; 3.975296e-01 ];
Tc_17  = [ -4.155421e+02 ; -3.568788e+02 ; 2.015300e+03 ];
omc_error_17 = [ 1.397091e-02 ; 1.320651e-02 ; 2.944055e-02 ];
Tc_error_17  = [ 1.684906e+01 ; 1.817748e+01 ; 1.588734e+01 ];

%-- Image #18:
omc_18 = [ 1.897194e+00 ; 1.084128e+00 ; 9.695700e-01 ];
Tc_18  = [ -6.485316e+02 ; -2.945145e+02 ; 1.934199e+03 ];
omc_error_18 = [ 9.145708e-03 ; 5.802838e-03 ; 1.022078e-02 ];
Tc_error_18  = [ 1.674649e+01 ; 1.776279e+01 ; 1.638626e+01 ];

%-- Image #19:
omc_19 = [ -2.173095e+00 ; -1.959349e+00 ; 8.503710e-02 ];
Tc_19  = [ -2.519754e+02 ; -3.610573e+02 ; 1.960274e+03 ];
omc_error_19 = [ 1.422218e-02 ; 9.543734e-03 ; 2.213095e-02 ];
Tc_error_19  = [ 1.612611e+01 ; 1.759153e+01 ; 1.425554e+01 ];

%-- Image #20:
omc_20 = [ 1.792001e+00 ; 9.269175e-01 ; 1.055069e+00 ];
Tc_20  = [ -3.520178e+02 ; -5.001732e+01 ; 1.121675e+03 ];
omc_error_20 = [ 9.325612e-03 ; 5.293179e-03 ; 8.381268e-03 ];
Tc_error_20  = [ 9.477997e+00 ; 1.026235e+01 ; 8.950645e+00 ];

%-- Image #21:
omc_21 = [ -2.329145e+00 ; -1.979562e+00 ; -1.166992e-01 ];
Tc_21  = [ 2.360348e+01 ; -1.410831e+02 ; 1.224833e+03 ];
omc_error_21 = [ 1.205565e-02 ; 1.112458e-02 ; 2.300165e-02 ];
Tc_error_21  = [ 9.856240e+00 ; 1.092531e+01 ; 8.781395e+00 ];

