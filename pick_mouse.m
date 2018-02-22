function v = pick_mouse(S, n, fig)
% pick_mouse captures the indices of n mouse-selected pixels and outputs 
% these indices in vector format (i.e. treating the image as a vector).
% INPUTS:
% S: the image dimention in format [rows, columns]
% n: the number of pixel positions to be captured
% fig: the integer identifier of the colour figure window
% OUTPUTS:
% v: a vector containing the pixel indices in vector format
if n > S(1)*S(2)
    error('You must choose N smaller than total pixel count S(1)*S(2)!')
end
figure(fig);
[x, y] = ginput(n);
v = sub2ind(S, int32(y), int32(x));
end

