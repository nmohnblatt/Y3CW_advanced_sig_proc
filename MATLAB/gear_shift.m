function [ mu ] = gear_shift( e )

max = 0.15;
tau = 2;

mu = max*( 1-exp(-abs(e)/tau) );

end

