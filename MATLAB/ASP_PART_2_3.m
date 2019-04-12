clear;
close all;

%% 2.3 CROSS-CORRELATION FUNCTION

%% Parameters
N = 1000; %length of the stochastic signal
tau_max = 20;
order = 12; %filter order
b = ones(order,1); %filter coefficients
a = 1; %filter coefficients

%% Signals
x = randn(1,N);
y = filter(b,a,x);

%% Computations
tau = -tau_max:tau_max;
R = xcorr(x, y, tau_max,'unbiased');


%% Plots

figure
stem(tau, R);
title('Estimate of the cross-correlation between X[n] and Y[n]');
xlabel('\tau');
ylabel('R_{XY}(\tau)');