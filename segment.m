function B = segment(B, k)
%segment uses K-means to segment a greyscale image into k shades and
%recolour each pixel with its cluster mean
% INPUTS:
%   B: array containing a greyscale image
%   k: number of shades to segment image into
% OUTPUTS:
%   B: array containing the segmented greyscale image

% shrink B to single, greyscale values of type double
Bg = double(B(:,:,1));

% do the K means segmentation
[Z,mu] = Kmeans(Bg,k);

% replace pixels with their cluster mean
Bg = mu(Z);

% triplicate the final data and rebuild the image
for i = 1:3
    B(:,:,i) = uint8(Bg);
end

end

