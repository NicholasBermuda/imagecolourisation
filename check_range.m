function [colourised, bad_fraction, outlier_count] = check_range(colourised)
% This function makes sure the number of values above 255 (or below 0) is
% small. It then replaces outliers with the corresponding endpoints
% INPUT/OUTPUT:
%   colourised: array containing reconstructed rgb image
% OUTPUT:
%   bad_fraction: the fraction of elements outside the good range
%   outlier_count: # of bad elements

outlier_count_high = sum(sum(sum(colourised > 255)));
outlier_count_low = sum(sum(sum(colourised < 0)));
outlier_count = outlier_count_high + outlier_count_low;
bad_fraction = outlier_count / numel(colourised);

colourised(colourised > 255) = 255;
colourised(colourised < 0) = 0;

end