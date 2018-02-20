function optimal_params = optimise(A,B,pixels,p,params)
%optimise Finds the optimal set of parameters
% INPUTS:
%   A: the full colour image
%   B: the greyscale image
%   pixels: the colour information
%   p: the type of error norm to use
%   params: i.c. vector of parameters to minimise over
% OUTPUTS:
%   optimal_params: parameters that minimise the image error

optimal_params = fminsearch(@cost_function, params);

    function cost = cost_function(params)
        % we must only pick phi from the specified RBFs
        if ~(params(4) == 1 || params(4) == 2)
            cost = inf;
        else % find the image error from colourising with these params
            cost = imageerror(A, colourise(A, B, pixels, params), p);
        end
    end
               
end

