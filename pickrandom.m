function v = pickrandom(S,N)
%pickrandom Chooses N random pixels from an image of size S
% INPUTS:
%   S: The size of the image to pick the grid from; a tuple (height, width)
%   N: The number of points to pick randomly
% OUTPUTS:
%   v: length N array storing indices of chosen pixels

v = sub2ind(S,randi(S(1),[N 1]),randi(S(2),[N 1]));

end

