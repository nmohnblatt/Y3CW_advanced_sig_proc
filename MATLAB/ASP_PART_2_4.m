clear;
close all;

%% 2.4.X AUTOREGRESSIVE MODELLING PARTS 2 to 5

%% Parameters
N = 250;
tau_max = N-1;
tau = -tau_max:tau_max;
p_max = 10;
p = 1:10;

%% Load data
load sunspot.dat
data = sunspot(1:N, 2); %use only the second column and the appropriate data length

%% Computations ACF
R = xcorr(data, tau_max, 'unbiased');
m = mean(data);
sigma = std(data);
centered_data = data - m;
R_centered = xcorr(centered_data, tau_max, 'unbiased');

%% Plots ACF

figure;
stem(tau, R);
xlabel('Correlation lag (s)');
ylabel('ACF of the sunspot data');

figure;
stem(tau, R_centered);
xlabel('Correlation lag (s)');
ylabel('ACF of the zero-mean sunspot data');



%% Yule-Walker

for p = 1:p_max;
    [coeffs, e(p), refl] = aryule(data, p);
end
 
pac = -refl;

figure
stem(pac);
title('Partial autocorrelation functions for sunspot series');
xlabel('Correlation lag k')
ylabel('Partial autocorrelation function a_{kk}')

normalised = (data-m)/sigma;
for p = 1:p_max;
    [coeff, e_n(p), refl_nrm] = aryule(normalised, p);
end

pac_nrm = -refl_nrm;

figure
stem(pac_nrm);
title('Partial autocorrelation functions for normalised sunspot series');
xlabel('Correlation lag k')
ylabel('Partial autocorrelation function a_{kk}')


%% Correct model order

figure
hold on
for p=1:10;
    MDL(p) = log(e_n(p)) + p*log(N)/N;
    AIC(p) = log(e_n(p)) + 2*p/N;
end
plot(MDL);
plot(AIC, '--');
title('MDL and AIC for sunspot series');
xlabel('Model order p');
legend('MDL', 'AIC');

%% Prediction

w = randn(N,1);

AR_1 = aryule(normalised, 1);
AR_2 = aryule(normalised, 2);
AR_10 = aryule(normalised, 10);

coeff_1 = -AR_1(2:length(AR_1));
coeff_2 = -AR_2(2:length(AR_2));
coeff_10 = -AR_10(2:length(AR_10));

m = 1; %prediction horizon

for i = 11:length(data);
    x_hat_1(i+m) = coeff_1(1)*data(i-1);
    x_hat_2(i+m) = coeff_2(1)*data(i-1) + coeff_2(2)*data(i-2);
    x_hat_10(i+m) = coeff_10(1)*data(i-1) + coeff_10(2)*data(i-2) + coeff_10(3)*data(i-3) ...
        + coeff_10(4)*data(i-4) + coeff_10(5) * data(i-5) + coeff_10(6)*data(i-6) ...
        + coeff_10(7)*data(i-7) + coeff_10(8)*data(i-8) + coeff_10(9)*data(i-9) ...
        + coeff_10(10)*data(i-10);
end


figure
subplot(3,1,1)
hold on
plot(x_hat_1)
plot(data)
legend('AR(1) prediction', 'Real data')
title('Sunsport series prediction for horizon m = 1')

subplot(3,1,2)
hold on
plot(x_hat_2)
plot(data)
legend('AR(2) prediction', 'Real data')
ylabel('Number of sunspots')

subplot(3,1,3)
hold on
plot(x_hat_10)
plot(data)
legend('AR(10) prediction', 'Real data')
xlabel('sample')
