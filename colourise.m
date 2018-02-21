function colourised = colourise(A,B,pixels,rbf,params)
%colourise Recolourises a greyscale image `B` given colour info from rgb
%image `A` at index locations `p`
% INPUTS:
%   A: array containing full colour rgb image
%   B: array containing greyscale image
%   pixels: vector of pixel indices where we have colour info
%   params: vector of parameters for the recolourisation in the form
%           [sigma_1 sigma_2 p phi_form_name delta] where all values are 
%           type double except phi_form_name which is type str
% OUTPUTS:
%   colourised: array containing reconstructed rgb image

params = [params(1:3); rbf; params(4)];

[~, K_mat, K_s] = make_K_s(A,B,pixels,params);

colourised = solve_matrix_problem(A,B,pixels,K_mat,K_s);

end

