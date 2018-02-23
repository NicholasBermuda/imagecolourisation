function err = imageerror(A, D, p, rule)
%imageerror Determines the error of a recolourised image compared to a
%full-colour image, as a Frobenius-like matrix p-norm sum(s) c_s*((sum(i,j)
%(A(i,j,s) - D(i,j,s))^p)/N)^1/p, where N is the number of pixels, s
%denotes an RGB index and c_s is the coefficient corresponding to that
%colour in an RGB2grey rule
% INPUTS:
%   A: array containing a full-colour image
%   D: array containing a recolourised image
%   p: double describing the type of norm to use
%   rule: a length-3 array containing a RGB2greyscale rule
% OUTPUTS:
%   err: a double containing an error value for the recolourised image

% determine the number of pixels in the image
S = size(A(:,:,1));
N = S(1)*S(2);

if ~exist('p','var') % choose p=2 if it's not given
    p = 2;
end

if ~exist('rule','var') % choose the default rule if one is not given
    rule = [0.299 0.587 0.114]; % PAL and NTSC standard rule
end

% initialise the error
err = 0;

% vectorised sum in each colour
for s = 1:3
    innersum = (sum(sum((A(:,:,s) - D(:,:,s))^p))/N)^(1/p);
    err = err + rule(s)*innersum;
end

end

