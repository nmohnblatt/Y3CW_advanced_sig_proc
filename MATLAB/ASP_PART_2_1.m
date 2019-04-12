clear;
close all;

%% 2.1 ACF OF UNCORRELATED SEQUENCES

%% Parameters
N = 1000;

%% Signals
x = randn(1,N);

%% Computations
tau = -999:999;
R = xcorr(x, 999, 'unbiased');

plot(tau, R);
axis([-0.75*N 0.75*N -1 1]);
title('Estimate of the autocorrelation of white Gaussian noise');
xlabel('\tau');
ylabel('R_X(\tau)');