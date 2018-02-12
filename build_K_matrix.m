function K = build_K_matrix(B, p1, p2, phi_form, params)
%build_K_matrix Builds the K matrix based on evaluations of the RBF. Can be
%used to construct K_D or K_s
% INPUTS:
%   B: array containing the greyscale image
%   p1: array containing indices/coords of first argument (p1 = p2 when
%   building K_D, p1 = B when building K_s)
%   p2: array containing indices/coords of second argument (always colour
%       information)
%   phi_form: function handle representing the functional form of RBF
%   params: array with variables [sigma_1 sigma_2 p]
% OUTPUTS:
%   K: array with RBF data relating distance and greyscale info

M = length(p1); % size of the first argument
N = length(p2); % size of the second argument

Bg = B(:,:,1); % pick one slice of B for ease of indexing convenience
S = size(Bg);
[coords_x_1, coords_y_1] = ind2sub(S,p1); % ind-->coords for later use
[coords_x_2, coords_y_2] = ind2sub(S,p2); % ind-->coords for later use

% initialise the K matrix
K = zeros(M,N);

% iteratively build K -- TODO: VECTORISE THIS CALCULATION
for i = 1:M
    x_coord_i = coords_x_1(i);
    y_coord_i = coords_y_1(i);
    data_i = [x_coord_i y_coord_i double(Bg(p1(i)))]; % [x y g]
    for j = 1:N
        x_coord_j = coords_x_2(j);
        y_coord_j = coords_y_2(j);
        data_j = [x_coord_j y_coord_j double(Bg(p2(j)))]; % [x y g] 
        K(i,j) = evaluate_phi(phi_form,[data_i;data_j],params);
    end
end

end

