function [ y, e, a_hat ] = signed_error( x, mu, number_of_taps )

N = length(x);
Nw = number_of_taps - 1;

a_hat = zeros(Nw,N);


for i = Nw+1:N;
    y(i) = a_hat(:,i)' * x(i-1:-1:i-Nw);
    e(i) = x(i) - y(i);
    a_hat(:,i+1) = a_hat(:,i) + mu*sign(e(i))*x(i-1:-1:i-Nw);
end
a_hat = a_hat(:, (1:N));


end

