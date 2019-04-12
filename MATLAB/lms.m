function [ y_hat, e, w ] = lms( x, z, mu, number_of_taps )

N = length(x);
w = zeros(number_of_taps, N);
Nw = number_of_taps - 1;

for i = Nw+1:N;
    y_hat(i) = w(:,i)' * x(i-Nw:i);
    e(i) = z(i) - y_hat(i);
    mu = gear_shift(e(i));
    w(:,i+1) = w(:,i) + mu*e(i)*x(i-Nw:i);
end

w = w(:, (1:N));

end

