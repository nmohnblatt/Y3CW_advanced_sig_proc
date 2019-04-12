clear;
close all;

%% 1.1 Statistical Estimation: Normal distribution

N = 1E5; %number of samples in each realisation
Ens = 10; %number of realisations in the ensemble
nbins = 10; %number of bins in the histogram

m = 0; %theoretical mean
sigma = 1;  %theoretical standard deviation

z = randn(1, N); %create a 1000-sample realisation

m_hat = mean(z); %compute sample mean
sigma_hat = std(z); %compute sample standard distribution

Z = randn(Ens, N); %create an ensemble of 10 1000-sample realisations

M = mean(Z,2); %compute each realisation's sample mean
SIGMA = std(Z,0,2);%compute each realisation's sample standard distribution

n = 1:Ens; %create vector for the x-axis

figure;
subplot(2,1,1);  % Scatter the sample means around the theoretical value
hold on;
scatter(n,M);
plot(n, m*ones(1, length(n)));
axis([1 10 -1 1]);
title('Distribution of the sample means for Z');
xlabel('Realisation z_{n}');
ylabel('Sample mean');

subplot(2,1,2); %Scatter the sample std deviations around the theoretical 
                %value
hold on;
scatter(n,SIGMA);
plot(n, sigma*ones(1, length(n)));
axis([1 10 0 2]);
title('Distribution of the sample standard deviations for Z');
xlabel('Realisation z_{n}');
ylabel('Sample standard deviation');

figure; %Produce a histogram to approximate the pdf
t = -5:.1:4.9;
pdf_z = 1/sqrt(2*pi)*exp(-t.^2/2);
histogram(z, nbins, 'Normalization', 'pdf');
axis([-5 5 0 0.5]);
hold on;
plot(t, pdf_z);

title('Approximation of pdf_{Z}(z) with 10 bins and N = 1000');
xlabel('z');
ylabel('pdf_{Z}(z)')