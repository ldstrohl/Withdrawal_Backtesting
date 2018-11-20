% visualize: viszualization of results from backtest sim
if ~plot_results
    return
end

% % Plot Laplace fit
% h = figure('Name','Laplace Fit');
% result = fit_ML_laplace(return_monthly, gca);
% RMS.laplace = result.RMS;
% 
% % Plot Gaussian fit
% h = figure('Name','Gaussian Fit');
% result = fit_ML_normal(return_monthly, gca);
% RMS.normal = result.RMS;
% 
% % Plot data
% figure('Name', 'Monthly return data')
% hist(return_monthly,100)

figure('Name','Portfolio (all)')
title('Portfolio (all)')
plot(portfolio_date,portfolio)
grid on
xlabel('Date')
ylabel('Dollars')

failure.depletion = portfolio_date(1,portfolio(end,:)<0);
failure.retention = portfolio_date(1,portfolio(end,:)<starting_portfolio);
success.depletion = 1 - length(failure.depletion)/length(portfolio(end,:));
success.retention = 1 - length(failure.retention)/length(portfolio(end,:));
fprintf('Success rate (depletion): %.1f%%\n',success.depletion*100)
fprintf('Success rate (retention): %.1f%%\n',success.retention*100)

figure('Name','Portfolio (depletions)')
title('Portfolio (depletions)')
plot(portfolio_date(:,portfolio(end,:)<0),portfolio(:,portfolio(end,:)<0))
grid on
xlabel('Date')
ylabel('Dollars')

figure('Name','Portfolio (retentions)')
title('Portfolio (depletions)')
plot(portfolio_date(:,portfolio(end,:)<starting_portfolio),portfolio(:,portfolio(end,:)<starting_portfolio))
grid on
xlabel('Date')
ylabel('Dollars')