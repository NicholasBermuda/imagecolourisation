function C = add_sparse_colour(A,B,p)
%add_sparse_colour Adds colour information from pixels `p` in `A`
% to the same pixels `p` in greyscale `B`
% INPUTS:
%   A: The fully RGB colour image in array form
%   B: The fully greyscale image in array form
%   p: A vector of pixel indices
% OUTPUTS:
%   C: A mostly greyscale image with RGB colour information in pixels `p`

C = B; % deep-copy, automagically
C(p) = A(p); % use p as a mask since it is a list of indices

end

