clear
close all

%% 5.3 VINYL DENOISING

load vinyl.mat
load ticks.mat

N = length(ticks_l);
Nyquist = FS/2;

%% Notch at 1500 Hz

[b1, a1] = butter(4, [1480/Nyquist 1520/Nyquist], 'stop');
denoised(:,1) = filter(b1, a1, s2h(:,1));
denoised(:,1) = filter(b1, a1, denoised(:,1));
denoised(:,2) = filter(b1, a1, s2h(:,2));
denoised(:,2) = filter(b1, a1, denoised(:,2));

%% Notch at 200 Hz

[b2, a2] = butter(1, [180/Nyquist 220/Nyquist], 'stop');
denoised(:,2) = filter(b2, a2, denoised(:,2));
denoised(:,2) = filter(b2, a2, denoised(:,2));

%% Periodograms

% Corrupted
[P_l, k_1_l] = pgm(s2h(:,1));
[P_r, k_1_r] = pgm(s2h(:,2));

% Original
[P_original_l, k_2_l] = pgm(s2h_original(:,1));
[P_original_r, k_2_r] = pgm(s2h_original(:,2));

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

%% Quantitative performance measure

error_l = norm((P_original_l - P_denoised_l))/norm(P_original_l);
error_r = norm((P_original_r - P_denoised_r))/norm(P_original_r);

