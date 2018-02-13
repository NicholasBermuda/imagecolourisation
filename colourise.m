function colourised = colourise(A,B,pixels,params)
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

% unroll the parameters
sigma_1 = params(1);
sigma_2 = params(2);
p = params(3);
phi_form_name = params(4);
phi_form = pick_phi_form(phi_form_name);
delta = params(5);
N = length(pixels);
S = size(A(:,:,1));

% we carry out the recolourisation in three stages corresponding to R, G, B

% the K matrices are agnostic for which colour we're reconstructing, only
% build them once
K_D = build_K_matrix(B,pixels,pixels,phi_form,[sigma_1 sigma_2 p]);
K_mat = K_D + N*delta*eye(N);
K_s = build_K_matrix(B,1:S(1)*S(2),pixels,phi_form,[sigma_1 sigma_2 p]);

colourised = zeros(size(B));

for s = 1:3 % find a_s for each colour separately
    %A_s = A(:,:,s); % colour data slice
    f_s = double(A(pixels + (s-1)*S(1)*S(2))); % the colour data w nice type for calcs
    a_s = K_mat\f_s; % solve the matrix problem without too much fuss
    % TODO: IMPLEMENT OUR OWN LINEAR SOLVER INSTEAD OF BACKSLASH?
    F_s = K_s*a_s; % reconstruct the colour information in colour `s`
    % and finally, add the actual known colour information to the reconstructed
    % image, because we might as well be as accurate as possible
    F_s(pixels) = A(pixels + (s-1)*S(1)*S(2));
    colourised(:,:,s) = reshape(F_s,S);
end

colourised = uint8(colourised);

end

