clear
close all

%% 4.2  LMS

%% Unknown system

b = [1 2 3 2 1]; a = 1;

%% Parameters

mu = 0.15;
N = 1000;
Nw = 4;

%% Generate signals

x = randn(N, 1);

y = filter(b, a, x);
sigma_y = std(y);
y = y/sigma_y;

sigma_nu = 0.1;
nu = sigma_nu*randn(N,1);
z = y + nu;

SNR_z = 10*log10(1/sigma_nu^2);

%% Use LMS

[y_hat, e, w] = lms(x, z, 0, Nw+1);
w_corrected = sigma_y*w;

plot(w_corrected')
xlabel('Iterations')
legend('w(0)', 'w(1)', 'w(2)', 'w(3)', 'w(4)')
title('Evolution of the coefficient over 1000 iterations')
%save_fig('ASP_PART_4_2/MU_P5');






