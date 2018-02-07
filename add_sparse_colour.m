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
for i = 1:3
    % now with 100% less indexing errors
    Ai = A(:,:,i);
    Ci = C(:,:,i);
    Ci(p) = Ai(p); % use p as a mask since it is a list of indices
    C(:,:,i) = Ci(:,:);
end

end

