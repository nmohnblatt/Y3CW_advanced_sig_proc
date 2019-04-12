function [ y_hat, e, w ] = nlms( x, z, mu, number_of_taps )

N = length(x);
w = zeros(number_of_taps, N);
Nw = number_of_taps - 1;

for i = Nw+1:N;
    y_hat(i) = w(:,i)' * x(i-Nw:i);
    e(i) = z(i) - y_hat(i);
    %mu = gear_shift(e(i));
    if norm(x(i-Nw:i)) == 0
        w(:,i+1) = w(:,i);
    else
        w(:,i+1) = w(:,i) + mu*e(i)*x(i-Nw:i)/norm(x(i-Nw:i))^2;
    end
end

w = w(:, (1:N));

end

