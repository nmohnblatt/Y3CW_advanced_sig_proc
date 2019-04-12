clear;
close all;

%% 3.1 AVERAGED PERIODOGRAM ESTIMATES

%% Non-averaged testing

figure
subplot(3,1,1)
[P, k] = pgm( randn(128,1) );
plot(k,P);
title('Periodogram of white noise')
legend('N = 128')

subplot(3,1,2)
[P, k] = pgm( randn(256,1) );
plot(k,P);
ylabel('Estimate of P_X(f)')
legend('N = 256')

subplot(3,1,3)
[P, k] = pgm( randn(512,1) );
plot(k,P);
xlabel('Normalized frequency (\times 2\pi rad/sec)')
legend('N = 512')

%% 4th order FIR averaging

b = 0.2*ones(1, 5);

figure
subplot(3,1,1)
[P, k] = pgm( randn(128,1) );
P = filter(b, 1, P);
plot(k,P);
title('Smoothed periodogram of white noise')
legend('N = 128')

subplot(3,1,2)
[P, k] = pgm( randn(256,1) );
P = filter(b, 1, P);
plot(k,P);
ylabel('Estimate of P_X(f)')
legend('N = 256')

subplot(3,1,3)
[P, k] = pgm( randn(512,1) );
P = filter(b, 1, P);
plot(k,P);
xlabel('Normalized frequency (\times 2\pi rad/sec)')
legend('N = 512')

%% Eight realisations & averaged periodogram

number_of_realisations = 8;
length = 128;

for i = 1:number_of_realisations
    wgn(i,:) = randn(1,length);
    [Pn(i,:), k] = pgm( wgn(i,:) );
    % figure; plot(k, Pn(i,:));
end

avg_periodogram = mean(Pn);

figure
plot(k, avg_periodogram)
xlabel('Normalized frequency (\times 2 \pi rad/sec)');
ylabel('Estimate of P_X(f)');
title(['Averaged periodogram of WGN over 8 realisations']);

