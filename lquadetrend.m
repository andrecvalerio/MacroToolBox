function lquadetrend(Y)
% Perform the log-quadratic filtering
% The aim of this function is to estimate the following regression, where y
% is the natural log of the series in question:
%                    y_t = a + bt + ct^2 + e_t
% Therefore, the residual of the regression will be the cycle component of
% the series and the fitted value of the regression will be the trend
T = length(Y);
a = ones(T,1);
b = [1:T]';
c = [1:T]'.^2;
X = [a b c];
beta = inv(X'*X)*X'*Y;
y_s = X*beta;
y_c = Y - y_s;
assignin('base','y_c',y_c)
assignin('base','y_s',y_s)

figure
subplot(2,1,1)
plot(y_s)
hold on
plot(Y)
legend('Trend','Actual data')
hold off

subplot(2,1,2)
plot(y_c)
legend('Cycle')
end
