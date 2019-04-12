clear;
close all;

%% 2.5 REAL WORLD SIGNALS: ECG FROM iAMP EXPERIMENT
% d) AR MODELLING OF HEART RATE

%% Load data

load('RRI_7_5');
load('RRI_unconstrained');
load('RRI_25');

%% Detrend data

unconstrained = detrend(60./unconstrained);
bpm_25 = detrend(60./bpm_25);
bpm_7_5 = detrend(60./bpm_7_5);

%% Parameters
p_max = 30;

%% Yule-Walker

data = bpm_7_5;
N = length(data);

for p = 1:p_max;
    [coeffs, e(p), refl] = aryule(data, p);
end
 
pac = -refl;

figure
stem(pac);
title('Partial autocorrelation functions for the bpm7.5 sequence');
xlabel('Correlation lag k')
ylabel('Partial autocorrelation function a_{kk}')

%% MDL & AIC

figure
hold on
for p=1:p_max;
    MDL(p) = log(e(p)) + p*log(N)/N;
    AIC(p) = log(e(p)) + 2*p/N;
end
plot(MDL);
plot(AIC, '--');
title('MDL and AIC for the bpm7.5 sequence');
xlabel('Model order p');
legend('MDL', 'AIC');