clear
close all

%% 4.6 SIGN ALGORITHMS

load Letters.mat

N = 1000;
a = [1 0.9 0.2];
b = 1;
mu =0.1;
Nw = 2;

nu = randn(N,1);

x = filter(b, a, nu);

input = s;

a_hat = zeros(Nw,N);

for i = Nw+1:N;
    y_1(i) = a_hat(:,i)' * input(i-1:-1:i-Nw);
    e(i) = input(i) - y_1(i);
    a_hat(:,i+1) = a_hat(:,i) + mu*e(i)*input(i-1:-1:i-Nw);
end
a_hat = a_hat(:, (1:N));

[ y_2, e_2, a_hat_2 ] = signed_error( input, mu, Nw+1 );
[ y_3, e_3, a_hat_3 ] = signed_regressor( input, mu, Nw+1 );
[ y_4, e_4, a_hat_4 ] = sign_sign( input, mu, Nw+1 );

subplot(2,2,1)
plot(a_hat')
xlabel('Iterations')
title('LMS')

subplot(2,2,2)
plot(a_hat_2')
xlabel('Iterations')
title('signed - error')

subplot(2,2,3)
plot(a_hat_3')
xlabel('Iterations')
title('signed - regressor')

subplot(2,2,4)
plot(a_hat_4')
xlabel('Iterations')
title('sign - sign')

figure
subplot(2,2,1)
plot(input); hold on; plot(y_1); 
xlabel('Iterations')
title('LMS')

subplot(2,2,2)
plot(input); hold on; plot(y_2)
xlabel('Iterations')
title('signed - error')

subplot(2,2,3)
plot(input); hold on; plot(y_3)
xlabel('Iterations')
title('signed - regressor')

subplot(2,2,4)
plot(input); hold on; plot(y_4)
xlabel('Iterations')
title('sign - sign')


