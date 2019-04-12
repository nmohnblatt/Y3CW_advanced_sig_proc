clear
close all

%% 5.6 VINYL DENOISING

load vinyl.mat

N = length(um);
Nyquist = FS/2;
mu = 1;
p = 20;

%% NLMS

[ y_hat_l, e_l, w_l ] = nlms( um(:,1), um_original(:,1), mu, p+1 );
[ y_hat_r, e_r, w_r ] = nlms( um(:,2), um_original(:,2), mu, p+1 );
denoised = [y_hat_l' y_hat_r'];

%% Evaluation

%% Periodograms

% Corrupted
[P_l, k_1_l] = pgm(um(:,1));
[P_r, k_1_r] = pgm(um(:,2));

% Original
[P_original_l, k_2_l] = pgm(um_original(:,1));
[P_original_r, k_2_r] = pgm(um_original(:,2));

% Denoised
[P_denoised_l, k_3_l] = pgm(denoised(:,1));
[P_denoised_r, k_3_r] = pgm(denoised(:,2));

figure
subplot(2,1,1)
hold on
plot(k_1_l*FS, P_original_l, 'b')
plot(k_1_l*FS, P_l, 'r')
plot(k_1_l*FS, P_denoised_l, 'g')
title('Left channel')
xlabel('Frequency (Hz)')
ylabel('Power')

subplot(2,1,2)
hold on
plot(k_1_r*FS, P_original_r, 'b')
plot(k_1_r*FS, P_r, 'r')
plot(k_1_r*FS, P_denoised_r, 'g')
title('Right channel')
xlabel('Frequency (Hz)')
ylabel('Power')

error_l = norm((P_original_l - P_denoised_l))/norm(P_original_l);
error_r = norm((P_original_r - P_denoised_r))/norm(P_original_r);

