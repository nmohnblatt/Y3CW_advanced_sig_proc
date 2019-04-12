function [  ] = pdf( input_signal )
%PDF This function outputs an estimate of the input's pdf

N = length(input_signal);
titlestr = sprintf('Estimated pdf of the input signal for N = %d', N);

[counts, centers] = hist(input_signal);
bin_width = diff(centers(1:2));
plot(centers, counts/(N*bin_width));
title(titlestr);

end

