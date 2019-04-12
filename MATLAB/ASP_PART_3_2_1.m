clear;
close all;

%% 3.2.1 to 3.2.4 SPECTRUM OF AUTOREGRESSIVE PROCESSES: WGN

%% Parameters

N = 1024;
transient = 40;
b = 1;
a = [1, 0.9];

%% Signals

x = randn(1, N+transient);
y = filter(b, a, x);

% Discard values that correspond to the filter's transient response
x = x(transient+1:length(x)); 
y = y(transient+1:length(y));

%% Plot and compare x and y

% subplot(2,1,1); plot(x); axis([0 length(x) -5 5]);
% subplot(2,1,2); plot(y); axis([0 length(y) -5 5]);

%% PSD of AR(1) process and periodogram estimate

[h, w] = freqz(b, a, 512);
plot(w/(2*pi), abs(h).^2);
hold on

[P, k] = pgm(y);
plot(k(1:floor(length(k)/2)), P(1:floor(length(P)/2)), 'r');
title('Comparison of the filter response PSD and the periodogram of y');
legend('PSD of filter response', 'Periodogram of y ');
xlabel('Normalized frequency (\times 2\pi rad/sec)');
ylabel('Power');

figure
plot(w/(2*pi), abs(h).^2);
hold on
plot(k(1:floor(length(k)/2)), P(1:floor(length(P)/2)), 'r');
title('Zoomed in on f = [0.4, 0.5]');
axis([0.4 0.5 0 400]);
legend('PSD of filter response', 'Periodogram of y ');
xlabel('Normalized frequency (\times 2\pi rad/sec)');
ylabel('Power');

%% Estimate a1 and sigma

R_hat = xcorr(y, 'unbiased');
midpoint = round(length(R_hat)/2);

a1_hat = -R_hat(midpoint+1)/R_hat(midpoint);
Var_hat = R_hat(midpoint) + a1_hat*R_hat(midpoint+1);

figure
[h2, w2] = freqz(Var_hat, [1 a1_hat], 512);
plot(w2/(2*pi), abs(h2).^2);
title('Model based estimate of the PSD');
xlabel('Normalized frequency (\times 2\pi rad/sec)');
ylabel('Power');

