function optimal_params = optimise(A,B,pixels,p,rbf,params,MaxFuncEvals)
%optimise Finds the optimal set of parameters
% INPUTS:
%   A: the full colour image
%   B: the greyscale image
%   pixels: the colour information
%   p: the type of error norm to use
%   params: i.c. vector of parameters to minimise over
% OUTPUTS:
%   optimal_params: parameters that minimise the image error

myoptions = optimset('TolFun',1e-3,'TolX',1e-3,'Display', 'iter', 'MaxFunEvals',MaxFuncEvals,'MaxIter',MaxFuncEvals,'PlotFcns',@optimplotfval);
optimal_params = fminsearch(@cost_function,params,myoptions);

    function cost = cost_function(params)
        cost = imageerror(A, colourise(A, B, pixels,rbf,params), p);
    end
               
end

