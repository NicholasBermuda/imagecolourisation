function form = pick_phi_form(label)
%pick_phi_form Picks a functional form for phi 
% INPUTS:
%   name: an index representing the functional form to use
%   options include 1 = 'guassian', 2 = 'compact_support_1'
% OUTPUTS:
%   form: a function handle for the selected form of phi


gaussian = @(r) exp(-r.^2);
compact_support_1 = @(r) ((max(1-r,0)).^4).*((4*r+1));

switch label
    case 1
        form = gaussian;
    case 2
        form = compact_support_1;
    otherwise
        form = gaussian;
end

end

