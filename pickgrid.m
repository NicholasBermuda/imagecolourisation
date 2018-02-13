function v = pickgrid(S,N)
%pickgrid Chooses a grid with N points from an image of size S
% INPUTS:
%   S: The size of the image to pick the grid from; a tuple (height, width)
%   N: The number of points to have on the grid OR size of grid in the form
%      (Nh, Nw)
% OUTPUTS:
%   v: length N array storing indices of chosen pixels

totalpixct = S(1)*S(2); % for error checking

if all(size(N) == 1) % we are given total number of points in grid
    if N > totalpixct
        error('You must choose a grid size smaller than the number of pixels in the image.')
    end
    aspect = S(2)/S(1); % aspect ratio of the image
    Nh = round(sqrt(aspect*N)); % number of points in grid along h axis
    Nw = round(N/Nh); % number of points in grid along w axis
else % we are given size of grid explicitly
    Nh = N(1);
    Nw = N(2);
    if Nh*Nw > totalpixct || Nh > S(1) || Nw > S(2)
        error('You must choose a grid size smaller than the number of pixels in the image.')
    end
end

% make the grid
gridh = round(linspace(1,S(1),Nh));
gridw = round(linspace(1,S(2),Nw));
[gridh, gridw] = meshgrid(gridw,gridh);

% convert the grid locations to coordinates
coords = [gridh(:) gridw(:)];

% convert coordinates to indices
v = sub2ind(S,coords(:,2),coords(:,1));
end

