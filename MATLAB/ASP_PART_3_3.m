clear;
close all;

%% 3.3 DIAL TONE PAD: Noise Free

%% Randomly generate number

number = [0 2 0 floor(10*rand(1,8))]

%% Parameters

fs = 32768;
dial_time = 0.25;
t = 0:1/fs:21*dial_time-1/fs;
samples_per_section = length(t)/21;


%% Generate signals

for i = 1:11;
    switch number(i)
        case 0
            f1(i) = 941;
            f2(i) = 1336;
        case 1   
            f1(i) = 697;
            f2(i) = 1209;
        case 2
            f1(i) = 697;
            f2(i) = 1336;
        case 3 
            f1(i) = 697;
            f2(i) = 1477;
        case 4
            f1(i) = 770;
            f2(i) = 1209;      
        case 5   
            f1(i) = 770;
            f2(i) = 1336;
        case 6
            f1(i) = 770;
            f2(i) = 1477;
        case 7 
            f1(i) = 852;
            f2(i) = 1209;
        case 8
            f1(i) = 852;
            f2(i) = 1336;    
        case 9
            f1(i) = 852;
            f2(i) = 1477;
    end
end

% Add zeros for the idle time
f1 = [f1(1) 0 f1(2) 0 f1(3) 0 f1(4) 0 f1(5) 0 ... 
    f1(6) 0 f1(7) 0 f1(8) 0 f1(9) 0 f1(10) 0 f1(11)];
f2 = [f2(1) 0 f2(2) 0 f2(3) 0 f2(4) 0 f2(5) 0 ...
    f2(6) 0 f2(7) 0 f2(8) 0 f2(9) 0 f2(10) 0 f2(11)];

% Create discrete-time signal
for i=1:length(t);
    y(i) = sin( 2*pi*t(i)*f1(ceil(i/samples_per_section)) ) ...
        + sin( 2*pi*t(i)*f2(ceil(i/samples_per_section)) );
end

%% Plots

figure
plot(t, y);
axis([t(1) t(3*samples_per_section) -2 2])
xlabel('Time (s)');
ylabel('Tone amplitude');
title('Two-tone signal for digits 0 and 2');

figure
spectrogram(y, hann(samples_per_section), 0, samples_per_section, fs);
title('Spectrogram of DTMF signal from a randomly generated London landline number');

%% Corrupt with WGN

SNR = 50;

signal_power = 1/2; % Power of two othrogonal sinusoids = 2* (amplitude^2)/2
                    % Assume idle half the time -> average power is
                    % the power of the sines divided by 2
                    
noise_sigma = sqrt( 10^(-SNR/10) );

titlestr = sprintf('Noise corrupted signal. SNR = %d', SNR);

% Create noise corrupted signal
for i=1:length(t);
    y(i) = sin( 2*pi*t(i)*f1(ceil(i/samples_per_section)) ) ...
        + sin( 2*pi*t(i)*f2(ceil(i/samples_per_section)) ) + noise_sigma*randn;
end

figure
spectrogram(y, hann(samples_per_section), 0, samples_per_section, fs);
title(titlestr);
