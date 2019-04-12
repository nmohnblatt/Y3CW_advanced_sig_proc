clear;
close all;

%% 2.5 REAL WORLD SIGNALS: ECG FROM iAMP EXPERIMENT
% c) AR MODELLING OF HEART RATE

%% Load data

load RRI.mat

%% Detrend data

unconstrained = detrend(unconstrained);
bpm_25 = detrend(bpm_25);
bpm_7_5 = detrend(bpm_7_5);

%% ACFs

max = floor((length(unconstrained)-1)/2);
tau_1 = -max:max;
R_1 = xcorr(unconstrained, max, 'unbiased');

max = floor((length(bpm_25)-1)/2);
tau_2 = -max:max;
R_2 = xcorr(bpm_25, max, 'unbiased');

max = floor((length(bpm_7_5)-1)/2);
tau_3 = -max:max;
R_3 = xcorr(bpm_7_5, max, 'unbiased');

%% Plots

figure
subplot(3,1,1)
plot(tau_1/fs, R_1)
legend('Unconstrained breathing')
title('ACF for the RR-interval series')

subplot(3,1,2)
plot(tau_2/fs, R_2)
ylabel('ACF')
legend('25 breaths per minute')

subplot(3,1,3)
plot(tau_3/fs, R_3)
xlabel('Autocorrelation lag (seconds)')
legend('7.5 breaths per minute')



