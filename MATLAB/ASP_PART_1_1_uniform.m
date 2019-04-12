clear;
close all;

%% 1.1 Statistical Estimation: Uniform Distribution

N = 1E3; %number of samples in each realisation
Ens = 10; %number of realisations in the ensemble
nbins = 10; %number of bins in the histogram

m = 1/2;  %theoretical mean
sigma = sqrt(3)/6; %theoretical standard deviation

x = rand(1, N); %create a 1000-sample realisation

m_hat = mean(x); %compute sample mean
sigma_hat = std(x); %compute sample standard distribution

X = rand(Ens, N); %create an ensemble of 10 1000-sample realisations

m_ensemble = mean(X,2); %compute each realisation's sample mean
sigma_ensemble = std(X,0,2); %compute each realisation's
                             %sample standard distribution

n = 1:Ens;  %create vector for the x-axis

figure;  % Scatter the sample means around the theoretical value
subplot(2,1,1);
hold on;
scatter(n,m_ensemble);
plot(n, m*ones(1, length(n)));
axis([1 10 0 1]);
title('Distribution of the sample means for X');
xlabel('Realisation x_{n}');
ylabel('Sample mean');

subplot(2,1,2); %Scatter the sample std deviations around the theoretical 
                %value
hold on;
scatter(n,sigma_ensemble);
plot(n, sigma*ones(1, length(n)));
axis([1 10 0 1]);
title('Distribution of the sample standard deviations for X');
xlabel('Realisation x_{n}');
ylabel('Sample standard deviation');

figure;  %Produce a histogram to approximate the pdf
t = 0:.1:1;
pdf_x = ones(1, 11);
histogram(x,nbins,'Normalization', 'pdf');
hold on
plot(t,pdf_x);
title('Approximation of pdf_{X}(x)');
xlabel('x');
ylabel('pdf_{x}(x)')