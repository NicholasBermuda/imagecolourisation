function colourised = solve_matrix_problem(A,B,pixels,K_mat,K_s)
% INPUTS:
%   A: array containing full colour rgb image
%   B: array containing greyscale image
%   pixels: vector of pixel indices where we have colour info
%   K_mat: K_D with added in identity * delta
%   K_s: TO BE CONFIRMED
% OUTPUTS:
%   colourised: array containing reconstructed rgb image

colourised = zeros(size(B));
S = size(A(:,:,1));

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

[colourised, bad_fraction, outlier_count] = check_range(colourised);
outlier_count
colourised = uint8(colourised);

end