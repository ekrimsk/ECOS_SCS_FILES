
clear all;


addpath(genpath('~/Documents/MATLAB/pdos-master/matlab'));
addpath(genpath('/home/erez/Documents/MATLAB/scs-matlab-master'));
addpath(genpath('/home/erez/Documents/MATLAB/osqp-matlab'));


load('ecos_v_scs'); 




disp('SCS Solve (OR not)...')

scs_settings.eps = 1e-4;
scs_settings.normalize = 0;
scs_settings.alpha = 1.5; 
scs_settings.max_iters = 100000;
scs_settings.acceleration_lookback = 10; 

[xp, sp, yp, status] = scs_direct(scs_data, scs_cones, scs_settings); 


disp('ECOS SOLVE')
ecos_opts = ecosoptimset('VERBOSE', 1,...
                    'FEASTOL', 1e-4,...
                    'ABSTOL', 1e-4);

[yy, dual_y, ecos_data, s, zz] = ecos(c, G_ecos, h_ecos,...
                                ecos_dims, A_ecos, b_ecos, ecos_opts);
