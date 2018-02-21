function plot_optimal_matrix(percents,optimal_params_matrix,whichparam)
% simple function to plot the parameters under percentage variation

figure
if whichparam == 1
    scatter(percents, optimal_params_matrix(1,:), 'r*')
    leg1 = legend('$\sigma_1$');
elseif whichparam == 2
    scatter(percents, optimal_params_matrix(2,:), 'r*')
    leg1 = legend('$\sigma_2$');
elseif whichparam == 3
    scatter(percents, optimal_params_matrix(3,:), 'r*')
    leg1 = legend('$p$');
elseif whichparam == 4
    scatter(percents, optimal_params_matrix(4,:), 'r*')
    leg1 = legend('$\delta$');
end

set(leg1,'Interpreter','latex');

end