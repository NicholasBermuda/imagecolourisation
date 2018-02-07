function seededrand = generaterandoms(seed)
% generaterandoms takes a certain seed and constructs a series of random
% numbers from this seed to maintain consistency
% INPUTS
%   seed: integer value that will start the generation
% OUTPUTS
%   seededrand: a random number generator made from the original seed

% to use, call rng(generaterandoms(seed)) or rng(seededrand)

if ~exist('seed','var') % choose the default seed if one is not given
    seed = 1;
end

seededrand = rng(seed, 'simdTwister');

end