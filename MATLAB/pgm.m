function [ periodogram, k ] = pgm( input_sequence )
%PGM This function computes an estimate of the input's periodogram
%
%  output arguments:
%
% 'periodogram' is the periodogram of the input sequence
% 'k' is a vector of normalised frequencies (2pi rad per sec)

N = length(input_sequence);
k = 0:1/N:(N-1)/N;
periodogram = 1/N*abs(fft(input_sequence)).^2;

end

