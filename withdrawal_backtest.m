% withdrawal_backtest: retirement withdrawal strategy backtest simulation
% Simulates various withdrawal strategies specified by user_input using
% historical market data for backtesting. 
if ~run_withdrawal_backtest
    return
end

portfolio = starting_portfolio*...
    ones(period*12,length(return_monthly)-12*period);
portfolio_date = zeros(period*12,length(return_monthly)-12*period);


% cycle loop
for k = 1:length(return_monthly)-12*period
    portfolio_date(1,k) = return_date((k-1)+1);
    
    % monthly loop
    for m = 2:period*12
        portfolio_date(m,k) = portfolio_date(m-1,k)+(1/12);
        
        % withdraw
        % apply return
        portfolio(m,k) = portfolio(m-1,k)-withdrawal_rate;
        portfolio(m,k) = portfolio(m,k)*...
            return_monthly((k-1)+m-1);
    end
end

