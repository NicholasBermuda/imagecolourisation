function colour_image = load_image(image_path, scale)
%%% Loads a colour image
% INPUTS
% image_path: the path (a string) of the image. Can be relative
% scale: OPTIONAL argumetn which rescale the image. scale is 1 if not
% specified
% OUTPUTS
% colour_image: the loaded image, stored in an array of size (length,
% width, 3) if the image corresponding to the path is indeed in colour

if ~exist('scale','var') % choose the default scale if one is not given
    scale = 1; % No rescaling
end

colour_image = imread(image_path);
colour_image = imresize(colour_image, scale);
end