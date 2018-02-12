function phi_ij = evaluate_phi(form,points,params)
%evaluate_phi Evaluates the appropriate form of phi for given
%pair of points with both colour and distance information
% INPUTS:
%   form: a function handle describing the functional form of phi
%   points: length 2 array containing the two points to be compared in phi
%           of the form (x_coord, y_coord, (colour triple)
%   params: length 3 array with [sigma_1, sigma_2, p]
% OUTPUTS:
%   phi_ij: evaluation of phi at the two points given in `points`

% unroll params
sigma_1 = params(1);
sigma_2 = params(2);
p = params(3);

% evaluate phi
coords = points(:,1:2);
greyscale = points(:,3);
phi_ij = form(norm(coords(1,:) - coords(2,:),2)/sigma_1)*...
    form(abs(greyscale(1) - greyscale(2))^p/sigma_2);

end

