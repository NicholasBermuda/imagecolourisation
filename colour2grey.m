function B = colour2grey(A, r)
%colour2grey Converts an RGB image `A` to greyscale accoring to a rule `r`
% INPUTS:
%   A: The image, stored in an array of size (length, width, 3) where the
%   third index stores RGB triples
%   r: Optional argument containing the rule to convert the RGB image to 
%   greyscale; a triple of coefficients of the linear combination of the 
%   colours. PAL and NTSC rule is the default
% OUTPUTS:
%   B: A greyscale image, stored in array of size (length, width, 1) where
%   the third index stores the greyscale value

if ~exist('r','var') % choose the default rule if one is not given
    r = [0.299 0.587 0.114]; % PAL and NTSC standard rule
end
    
B = uint8(zeros(size(A)));

% form the linear combination
for i = 1:3
    B(:,:,:) = B(:,:,:) + r(i)*A(:,:,i);
end

end

