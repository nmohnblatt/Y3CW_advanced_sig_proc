clear;
close all;

%% 3.4 RESPIRATORY SINUS ARRHYTHMIA FROM RR-INTERVALS

load RRI.mat;

%% Detrend data

unconstrained = detrend(unconstrained);
bpm_25 = detrend(bpm_25);
bpm_7_5 = detrend(bpm_7_5);


%% Standard periodograms

[P1, k1] = pgm(unconstrained);
[P2, k2] = pgm(bpm_25);
[P3, k3] = pgm(bpm_7_5);

figure
plot(k1*fs, P1)
xlabel('Frequency (Hz)')
ylabel('Power/Hertz')
title('Estimate of the PSD for the first trial')
%save_fig('/ASP_PART_3_4/PGM_T1');

figure
plot(k2*fs, P2)
xlabel('Frequency (Hz)')
ylabel('Power/Hertz')
title('Estimate of the PSD for the second trial')
%save_fig('/ASP_PART_3_4/PGM_T2');

figure
plot(k3*fs, P3)
xlabel('Frequency (Hz)')
ylabel('Power/Hertz')
title('Estimate of the PSD for the third trial')
%save_fig('/ASP_PART_3_4/PGM_T3');

%% Averaged periodograms

window_time = 50;
win_length = window_time*fs;

% Make the signal divisible into frames of the window size
temp = unconstrained(1:win_length*floor(length(unconstrained)/win_length));

% Divide the signal: Each row is a segment
temp2 = reshape(temp, win_length, [])';

% Take periodogram of each segment
for i = 1:length(temp)/win_length
    [P1_avg(i,:), k1_avg] = pgm( temp2(i,:) );
end

% Average these periodograms
avg_1 = mean(P1_avg);

% Create title string
titlestr = sprintf('Averaged periodogram for trial 1 with %d s window', window_time);

% Plot the averaged periodogram
figure
plot(k1_avg*fs, avg_1);
xlabel('Frequency (Hz)');
ylabel('Power/Hertz');
title(titlestr)
%save_fig('ASP_PART_3_4/AVG_PGM_T1_50');

% Repeat this procedure for trial 2
temp = bpm_25(1:win_length*floor(length(bpm_25)/win_length));
temp2 = reshape(temp, win_length, [])';
for i = 1:length(temp)/win_length
    [P2_avg(i,:), k2_avg] = pgm( temp2(i,:) );
end
avg_2 = mean(P2_avg);

titlestr = sprintf('Averaged periodogram for trial 2 with %d s window', window_time);

figure
plot(k2_avg*fs, avg_2);
xlabel('Frequency (Hz)');
ylabel('Power/Hertz');
title(titlestr)
%save_fig('ASP_PART_3_4/AVG_PGM_T2_50');

% Repeat this procedure for trial 3
temp = bpm_7_5(1:win_length*floor(length(bpm_7_5)/win_length));
temp2 = reshape(temp, win_length, [])';
for i = 1:length(temp)/win_length
    [P3_avg(i,:), k3_avg] = pgm( temp2(i,:) );
end
avg_3 = mean(P3_avg);

titlestr = sprintf('Averaged periodogram for trial 3 with %d s window', window_time);

figure
plot(k3_avg*fs, avg_3);
xlabel('Frequency (Hz)');
ylabel('Power/Hertz');
title(titlestr)
%save_fig('ASP_PART_3_4/AVG_PGM_T3_50');







