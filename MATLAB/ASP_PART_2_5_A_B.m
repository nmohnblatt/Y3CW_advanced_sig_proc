clear;
close all;

%% 2.5 REAL WORLD SIGNALS: ECG FROM iAMP EXPERIMENT
% a) and b) HEART RATE PDE

%% Load data
load RRI.mat;

%% Parameters

alpha = 1; % Use 0.6 or 1

%% Computations
time = 0:1/fs:(length(unconstrained)-1)/fs;
h = 60./unconstrained;


for k = 1:length(h)/10
    lower = k*10-9;
    upper = k*10;
    h_hat(k) = alpha/10*sum(h(lower:upper));
end

%% Plots

pdf(h)
axis([30 90 0 0.16])

figure
pdf(h_hat)
axis([30 90 0 0.16])
