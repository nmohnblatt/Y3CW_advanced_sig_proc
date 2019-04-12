clear
close all

%% 5.4 VINYL DENOISING

load vinyl.mat
load ticks.mat

N = length(ticks_l);
Nyquist = FS/2;
mu = 1;
p = 100;

%% NLMS

[ y_hat_l, e_l, w_l ] = nlms( s2h(:,1), s2h_original(:,1), mu, p+1 );
[ y_hat_r, e_r, w_r ] = nlms( s2h(:,2), s2h_original(:,2), mu, p+1 );
denoised = [y_hat_l' y_hat_r'];

%% Evaluation

% Original
[P_original_l, k_2_l] = pgm(s2h_original(:,1));
[P_original_r, k_2_r] = pgm(s2h_original(:,2));

figure
[P_denoised_l, k] = pgm(denoised(:,1));
plot(k*FS, P_denoised_l);

figure
[P_denoised_r, k] = pgm(denoised(:,2));
plot(k*FS, P_denoised_r);

error_l = norm((P_original_l - P_denoised_l))/norm(P_original_l);
error_r = norm((P_original_r - P_denoised_r))/norm(P_original_r);
