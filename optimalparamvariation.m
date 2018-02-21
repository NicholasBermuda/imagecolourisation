function optimal_params_matrix = optimalparamvariation(A,B,p,rbf,params,percents,pixeltype,MaxFuncEvals,bestguesses)
%optimalparamvariation Finds the optimal set of parameters for different
%percents of pixels coloured
% INPUTS:
%   A: the full colour image
%   B: the greyscale image
%   pixels: the colour information
%   p: the type of error norm to use
%   params: i.c. vector of parameters to minimise over
%   pixeltype: either random or grid
%   MaxFuncEvals: number of times in optimization problem to iterate
%   bestguesses: the previous matrix for the given values with parameters
% OUTPUTS:
%   optimal_params_matrix: parameters that minimise the image error for
%   each percent

optimal_params_matrix = zeros(4,length(percents));
S = size(A(:,:,1));

for i=1:length(percents)
    
    N = round(percents(i)*S(1)*S(2)/100); % add colour to a percentage

    if pixeltype == 'rand'
        pixels = pickrandom(S,N);
    elseif pixeltype == 'grid'
        pixels = pickgrid(S,N);
    else
        pixels = pickrandom(S,N);
        % if you mess up, I want random
    end

    params = bestguesses(:,i);
    % only add this type of thing if you want to introduce new percent
    % below 0.25%
    %if i>1
    %    params = bestguesses(:,i-1);
    %elseif i==1
    %    params = bestguesses(:,i);
    %end
    optimal_params = optimise(A,B,pixels,p,rbf,params,MaxFuncEvals);
    optimal_params_matrix(:,i) = optimal_params;
 
end
end
