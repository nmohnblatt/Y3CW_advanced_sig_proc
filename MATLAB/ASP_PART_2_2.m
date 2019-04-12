clear;
close all;

%% 2.2 ACF OF CORRELATED SEQUENCES

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
R = xcorr(y, tau_max,'unbiased');

%% Plots

figure
impz(b,a)
axis ([-2 15 0 2])

figure
stem(tau, R);
title('Estimate of the autocorrelation of white Gaussian noise');
xlabel('\tau');
ylabel('R_X(\tau)');