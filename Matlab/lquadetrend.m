function lquadetrend(Y)
% André Cordeiro Valério - 2018
% Perform the log-quadratic detrending
% The aim of this function is to estimate the following regression, where y
% is the natural log of the series in question:
%                    y_t = a + bt + ct^2 + e_t
% Therefore, the residual of the regression will be the cycle component of
% the series and the fitted value of the regression will be the trend
T = length(Y);                          % Size of data
a = ones(T,1);                          % Generating the variables for the econometric
b = [1:T]';                             % equation of log-quadratic detrending
c = [1:T]'.^2;
X = [a b c];                            % Putting everybody together
beta = inv(X'*X)*X'*Y;                  % Good old OLS estimator
y_s = X*beta;                           % Fitted value aka trend component
y_c = Y - y_s;                          % Difference between actual data and trend aka cycle component
                                        % Now begin the amenities
name = inputname(1);                    % Obtaining the time series name
assignin('base',strcat(name,'_c'),y_c)  % Storing the cyclical component of the serie
assignin('base',strcat(name,'_s'),y_s)  % Storing the trend component of the serie

figure                                  % Begin figure  
subplot(2,1,1)                          % First plot: Trend vs Actual data
plot(y_s)
hold on
plot(Y)
legend('Trend','Actual data')
hold off

subplot(2,1,2)                          % Second plot: cyclical component
plot(y_c)
legend('Cycle')
end
