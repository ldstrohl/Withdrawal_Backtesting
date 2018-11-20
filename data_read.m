% data_read: read and parse Shiller S&P 500 dataset for use by sims
data = xlsread('ie_data_with_TRCAPE','Data');
return_monthly = [1;data(2:end,10)./data(1:end-1,10)];
return_date = data(1:end,6);
