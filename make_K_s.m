function [K_D, K_mat, K_s] = make_K_s(A,B,pixels,params)
% make_K_s creates the K matrix since we only need to build it once
% INPUTS:
%   A: array containing full colour rgb image
%   B: array containing greyscale image
%   pixels: vector of pixel indices where we have colour info
%   params: vector of parameters for the recolourisation in the form
%           [sigma_1 sigma_2 p phi_form_name delta] where all values are 
%           type double except phi_form_name which is type str
% OUTPUTS:
%   K_D: nxn matrix whose i,jth element is k(xi,xj)
%   K_mat: K_D with added in identity * delta
%   K_s: TO BE CONFIRMED

% unroll the parameters
sigma_1 = params(1);
sigma_2 = params(2);
p = params(3);
phi_form_name = params(4);
phi_form = pick_phi_form(phi_form_name);
delta = params(5);
N = length(pixels);
S = size(A(:,:,1));

% the K matrices are agnostic for which colour we're reconstructing, only
% build them once
K_D = build_K_matrix(B,pixels,pixels,phi_form,[sigma_1 sigma_2 p]);
K_mat = K_D + N*delta*eye(N);
K_s = build_K_matrix(B,1:S(1)*S(2),pixels,phi_form,[sigma_1 sigma_2 p]);

end