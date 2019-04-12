clear
close all

%% 4.5B SPEECH RECOGNITION

load Letters.mat

%% Parameters

N = 1000;
fs = 44100;
Nw = 2;
mu = 1;

%% Predictor
    
 a_hat = zeros(Nw,N);

input = e;
input = downsample(interp(input,160),441); % Change smpling rate
N = length(input);
fs = 16000;

time = 0:1/fs:(N-1)/fs;

for i = Nw+1:N;
    y(i) = a_hat(:,i)' * input(i-1:-1:i-Nw);
    e(i) = input(i) - y(i);
    a_hat(:,i+1) = a_hat(:,i) + mu*e(i)*input(i-1:-1:i-Nw);
end
a_hat = a_hat(:, (1:N));

R = 10*log10(var(input)/var(y));


plot(time,input')
hold on
plot(time, y)
xlabel('Time (s)')
ylabel('Amplitude');
title('Speech signal prediction: letter E')
legend('Signal', 'Prediction')