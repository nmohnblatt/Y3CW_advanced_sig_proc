clear
close all

%% 4.1  WIENER FILTER

%% Unknown system

b = [1 2 3 2 1]; a = 1;

%% Signals

N = 1000;

x = randn(N, 1);
y = filter(b, a, x);
sigma_y = std(y);
y = y/sigma_y;

sigma_nu = [0.1 0.5 1 5 7 10];

for i = 1:6;
nu = sigma_nu(i)*randn(N,1);

z = y + nu;

SNR_z(i) = 10*log10(1/sigma_nu(i)^2);

%% Wiener filter coefficients

Nw = 4;

% Calculate Rxx
r_xx = xcorr(x, 'unbiased');
R_xx = toeplitz(r_xx(N:N+Nw));

% Calculate pzx
p_zx = xcorr(z, x, 'unbiased');
p_zx = p_zx(N:N+Nw);

% Compute optimal filter
w_opt(i,:) = inv(R_xx)*p_zx;

w_opt_denorm(i,:) = w_opt(i,:)*sigma_y;
end



