% Load CSV files
folder = 'C:/Users/aidan/OneDrive/Desktop/Centrality metrics/MVGC';  % User-defined path
filePattern = fullfile(folder, '*.csv');
csvFiles = dir(filePattern);

% Compute log returns
log_returns = [];
labels = strings(length(csvFiles), 1);  % Array to store labels

for k = 1:length(csvFiles)
    baseFileName = csvFiles(k).name;
    fullFileName = fullfile(csvFiles(k).folder, baseFileName);
    
    % Read the table
    cityTable = readtable(fullFileName);
    
    % Extract 'Index' column data
    cityData = cityTable.Index;
    
    % Calculate log returns
    logReturn = diff(log(cityData));
    
    % Normalize log returns
    logReturn = (logReturn - mean(logReturn)) / std(logReturn);
    
    % Append to log_returns matrix
    log_returns = [log_returns, logReturn];
    
    % Extract city name from file name, remove numbers and dot, and store in labels
    [~, cityName, ~] = fileparts(baseFileName);
    cityName = regexprep(cityName, '^\d+\.', '');  % Remove leading numbers and dot
    labels(k) = cityName;
end

% Combine log return values into a matrix
data = log_returns;

% Settings for MVGC analysis
n_vars = size(data, 2);  % Number of variables
n_obs = size(data, 1);   % Number of observations

% MVGC parameter settings
regmode = 'OLS';  % Regression mode
icregmode = 'LWR';  % Information criterion regression mode
morder = 'AIC';  % Model order selection
momax = 7;  % Maximum model order

% Multivariate Granger causality analysis using MVGC package
X = data';  % MVGC package requires data in variables x observations format

% Estimate model order
[AIC, BIC] = tsdata_to_infocrit(X, momax, icregmode);
[~, aic_min] = min(AIC);
morder = aic_min;
display(morder);

% Fit multivariate model
[A, SIG] = tsdata_to_var(X, morder, regmode);

% Perform Granger causality analysis
n = size(X, 1);  % Number of variables
G = nan(n, n);

for i = 1:n
    for j = 1:n
        if i ~= j
            G(i, j) = var_to_mvgc(A, SIG, i, j, X, regmode, 'F');
        end
    end
end

% Output results
G_table = array2table(G, 'VariableNames', labels, 'RowNames', labels);

% Save to CSV file
outputFileName = 'MVGC_results.csv';
writetable(G_table, outputFileName, 'WriteRowNames', true);

disp('Multivariate Granger Causality (MVGC) matrix (rows: from, columns: to):');
disp(G_table);
disp(['Results saved to ', outputFileName]);
