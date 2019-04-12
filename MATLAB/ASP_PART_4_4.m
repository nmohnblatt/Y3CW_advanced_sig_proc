clear
close all

%% 4.4 IDENTIFICATION OF AR PROCESSES

%% Parameters

a = [1 0.9 0.2];
b = 1;
N = 1E5;
mu = 0.01;
number_of_taps = 3;
Nw = 2;

%% Signals

nu = randn(N,1);

%% Synthesis

x = filter(b, a, nu);

%% Analysis

a_hat = zeros(Nw,N);

for i = Nw+1:N;
    y(i) = a_hat(:,i)' * x(i-1:-1:i-Nw);
    e(i) = x(i) - y(i);
    a_hat(:,i+1) = a_hat(:,i) + mu*e(i)*x(i-1:-1:i-Nw);
end

a_hat = a_hat(:, (1:N));
plot(a_hat')
legend('a(1)', 'a(2)');
xlabel('Iterations');
title('Estimation of the AR(2) coefficients for 10 000 iterations');
