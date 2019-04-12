function [  ] = save_fig( filename )
% This function saves the current figure as a .fig and a .jpg

savefig(filename);    %save figure as a .fig file
print(filename, '-djpeg');    %print figure to a .jpeg image

end

