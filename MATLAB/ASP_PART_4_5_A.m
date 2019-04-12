clear
close all

%% 4.5A SPEECH RECOGNITION

%% Parameters

fs = 44100;
N = 1000;
T = N/fs;

%% Recorder

% Record your voice for T seconds.
recObj = audiorecorder(fs, 16, 1);
disp('Start speaking.')
recordblocking(recObj, 10);
disp('End of Recording.');

% Play back the recording.
play(recObj);

% Store data in double-precision array.
myRecording = getaudiodata(recObj);

% Plot the waveform.
plot(myRecording);