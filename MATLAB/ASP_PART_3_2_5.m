clear;
close all;
load sunspot.dat;

%% 3.2.5 SPECTRUM OF AUTOREGRESSIVE PROCESSES: SUNSPOT SERIES

%% Parameters

transient = 40;
b = 1;
a = [1, 0.9];

%% Signals

%Original
x = sunspot(:,2);

%Centered
x_c = detrend(x);

% WGN
n = randn(1, length(x));


%% Periodogram

figure
[P, k] = pgm(x);
plot(k(1:floor(length(k)/2)), P(1:floor(length(P)/2)), 'r');
title('Periodogram of the sunspot series');
xlabel('Normalized frequency (\times 2\pi rad/sec)');
ylabel('Power');

figure
[P, k] = pgm(x_c);
plot(k(1:floor(length(k)/2)), P(1:floor(length(P)/2)), 'r');
title('Periodogram of the centred sunspot series');
xlabel('Normalized frequency (\times 2\pi rad/sec)');
ylabel('Power');

%% Model-based PSD estimate

input = x_c; % Choose between x and x_c for original or centred

% AR(1)
[AR1, e1] = aryule(input,1); 
[h1, w1] = freqz(e1, AR1, 512);
figure; plot(w1/(2*pi), abs(h1).^2);
title('AR(1)-based estimate of the centred sunspot series PSD');
xlabel('Normalized frequency (\times 2\pi rad/sec)');
ylabel('Power');

% AR(2)
[AR2, e2] = aryule(input,2); 
[h2, w2] = freqz(e2, AR2, 512);
figure; plot(w2/(2*pi), abs(h2).^2);
title('AR(2)-based estimate of the centred sunspot series PSD');
xlabel('Normalized frequency (\times 2\pi rad/sec)');
ylabel('Power');

% AR(10)
[AR10, e10] = aryule(input,10);
[h10, w10] = freqz(e10, AR10, 512);
figure; plot(w10/(2*pi), abs(h10).^2);
title('AR(10)-based estimate of the centred sunspot series PSD');
xlabel('Normalized frequency (\times 2\pi rad/sec)');
ylabel('Power');

% AR(20)
[AR20, e20] = aryule(input,20);
[h20, w20] = freqz(e20, AR20, 512);
figure; plot(w20/(2*pi), abs(h20).^2);
title('AR(20)-based estimate of the centred sunspot series PSD');
xlabel('Normalized frequency (\times 2\pi rad/sec)');
ylabel('Power');



