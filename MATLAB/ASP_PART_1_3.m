clear;
close all;

%% 1.3 ESTIMATION OF PROBABILITY DISTRIBUTIONS

%% Parameters
M = 1;
N = 100;

%% Process 3
a_2 = 0.5;
m = 3;
rp3 = (rand(M,N)-0.5)*m + a_2;

%% Theoretical pdf

x = -1:0.1:2;
theoretical = ones(1, length(x))/3;

%% Estimate using pdf function

figure
hold on
plot(x, theoretical)
pdf(rp3)
legend('Theoretical PDF', 'Estimated PDF')
