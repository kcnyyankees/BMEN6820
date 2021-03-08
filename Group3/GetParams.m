function [params_name,params_val] = GetParams()

% Read text file to acquire parameter values 
% 
% Parameters:
%     - beta
%     - q
%     - theta
%     - sigma
%     - e
%     - alpha
%     - gammaI
%     - gammaA
%     - lambda
%     - deltaQ
%     - gammaH


% Get files
param_files = dir('*.txt'); 
N = length(param_files); 

% Read data from files, keep second column
for i = 1:N
    filename = param_files(i).name;
    
    % Get data from text files 
    data = readtable(filename,'Format','%s%s','ReadVariableNames', false);
  
    % Save first (A) and second (B) data column to string cell arrays
    % NOTE: Data files need same number of rows to work
    A(:,1) = data(:,1);
    B(:, i) = data(:, 2);
end

% Convert to string cell array, to string maxtrix of parameter names 
params_name = string(table2array(A));

% Convert to string cell array, to string maxtrix, to decimal matrix 
% converting fractions to decimals) of parameter values
params_val = vpa(string(table2array(B)));

end

