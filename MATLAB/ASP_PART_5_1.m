clear
close all

%% 5.1 and 5.2 VINYL DENOISING

load vinyl.mat

%% Corrupted signal

[P_l, k_1_l] = pgm(s2h(:,1));
[P_r, k_1_r] = pgm(s2h(:,2));

subplot(1,2,1)
plot(k_1_l*FS, P_l);
title('Left channel')
xlabel('Frequency (Hz)')
ylabel('Power')

subplot(1,2,2)
plot(k_1_r*FS, P_r);
title('Right channel')
xlabel('Frequency (Hz)')
ylabel('Power')

%% Original signal

[P_original_l, k_2_l] = pgm(s2h_original(:,1));
[P_original_r, k_2_r] = pgm(s2h_original(:,2));

figure
subplot(1,2,1)
plot(k_2_l*FS, P_original_l);
title('Left channel')
xlabel('Frequency (Hz)')
ylabel('Power')

subplot(1,2,2)
plot(k_2_r*FS, P_original_r);
title('Right channel')
xlabel('Frequency (Hz)')
ylabel('Power')

%% Noise identification

ticks = s2h - s2h_original;

[P_ticks_l, k_3_l] = pgm(ticks(:,1));
[P_ticks_r, k_3_r] = pgm(ticks(:,2));

figure
subplot(1,2,1)
plot(k_3_l*FS, P_ticks_l);
title('Left channel')
xlabel('Frequency (Hz)')
ylabel('Power')

subplot(1,2,2)
plot(k_3_r*FS, P_ticks_r);
title('Right channel')
xlabel('Frequency (Hz)')
ylabel('Power')

ticks_l = ticks(:,1);
ticks_r = ticks(:,2);

