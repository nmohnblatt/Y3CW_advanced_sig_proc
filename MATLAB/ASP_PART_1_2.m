clear;
close all;

%% 1.2 STOCHASTIC PROCESSES

%% Parameters
M = 4;
N = 1000;

%% Process 1
a_1 = 0.02;
b = 5;
Mc = ones(M,1)*b*sin((1:N)*pi/N);
Ac = a_1*ones(M,1)*[1:N];
rp1 = (rand(M,N)-0.5).*Mc+Ac;

ensemble_mean_rp1 = mean(rp1,1);
ensemble_stdd_rp1 = std(rp1,0,1);
time_average_rp1 = mean(rp1,2);
time_stdd_rp1 = std(rp1,0, 2);

%% Process 2
Ar = rand(M,1)*ones(1,N);
Mr = rand(M,1)*ones(1,N);
rp2 = (rand(M,N)-0.5).*Mr+Ar;

ensemble_mean_rp2 = mean(rp2, 1);
ensemble_stdd_rp2 = std(rp2, 0, 1);
time_average_rp2 = mean(rp2, 2);
time_stdd_rp2 = std(rp2, 0, 2);

%% Process 3
a_2 = 0.5;
m = 3;
rp3 = (rand(M,N)-0.5)*m + a_2;

ensemble_mean_rp3 = mean(rp3,1);
ensemble_stdd_rp3 = std(rp3, 0, 1);
time_average_rp3 = mean(rp3, 2);
time_stdd_rp3 = std(rp3, 0, 2);

%% Plots: ensemble statistics

figure;
plot(ensemble_mean_rp1);
title('Process 1: ensemble mean as a function of time');
xlabel('Time (n)');
ylabel('Ensemble mean (\mu[n])');
axis([0 100 0 2]);
% savefig('pr1_ensemble_mean');    %save figure as a .fig file
% print('pr1_ensemble_mean', '-djpeg');    %print figure to a .jpeg image

figure;
plot(ensemble_mean_rp2);
title('Process 2: ensemble mean as a function of time');
xlabel('Time (n)');
ylabel('Ensemble mean (\mu[n])');
axis([0 100 0 2]);
% savefig('pr2_ensemble_mean');    %save figure as a .fig file
% print('pr2_ensemble_mean', '-djpeg');    %print figure to a .jpeg image

figure;
plot(ensemble_mean_rp3);
title('Process 3: ensemble mean as a function of time');
xlabel('Time (n)');
ylabel('Ensemble mean (\mu[n])');
axis([0 100 0 2]);
% savefig('pr3_ensemble_mean');    %save figure as a .fig file
% print('pr3_ensemble_mean', '-djpeg');    %print figure to a .jpeg image


figure;
plot(ensemble_stdd_rp1);
title('Process 1: ensemble standard deviation as a function of time');
xlabel('Time (n)');
ylabel('Ensemble standard deviation (\sigma[n])');
axis([0 100 0 2]);
% savefig('pr1_ensemble_std');    %save figure as a .fig file
% print('pr1_ensemble_std', '-djpeg');    %print figure to a .jpeg image

figure;
plot(ensemble_stdd_rp2);
title('Process 2: ensemble standard deviation as a function of time');
xlabel('Time (n)');
ylabel('Ensemble standard deviation (\sigma[n])');
axis([0 100 0 2]);
% savefig('pr2_ensemble_std');    %save figure as a .fig file
% print('pr2_ensemble_std', '-djpeg');    %print figure to a .jpeg image

figure;
plot(ensemble_stdd_rp3);
title('Process 3: ensemble standard deviation as a function of time');
xlabel('Time (n)');
ylabel('Ensemble standard deviation (\sigma[n])');
axis([0 100 0 2]);
% savefig('pr3_ensemble_std');    %save figure as a .fig file
% print('pr3_ensemble_std', '-djpeg');    %print figure to a .jpeg image

