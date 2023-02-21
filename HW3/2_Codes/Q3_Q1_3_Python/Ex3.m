% Generate data for y(k+1) = 0.3y(k) + 0.6y(k-1) + f(u(k))
% f(u) = 0.6*sin(pi*u) + 0.3*sin(3pi*u) + 0.1*sin(5pi*u)
% u(k) = 0.5*sin(0.1*pi*k) + 0.5*sin(0.2*pi*k) + 0.5*sin(0.3*pi*k)
% y(k) = 0.5*sin(0.1*pi*k) + 0.5*sin(0.2*pi*k) + 0.5*sin(0.3*pi*k)
% y(0) = 0, y(1) = 0
% u(0) = 0, u(1) = 0
% k = 0, 1, 2, ..., 10000

clear all
close all
clc

% Generate input
u = zeros(10001, 1);
for k = 2:10001
    u(k) = 0.5*sin(0.1*pi*k) + 0.5*sin(0.2*pi*k) + 0.5*sin(0.3*pi*k);
end

% Generate output
y = zeros(10001, 1);
for k = 3:10001
    y(k) = 0.3*y(k - 1) + 0.6*y(k - 2) + 0.6*sin(pi*u(k)) + 0.3*sin(3*pi*u(k)) + 0.1*sin(5*pi*u(k));
end

data = [u y];
TrainData = data(1:7500,:);
TestData = data(7501:end,:);

% # % Plot
% # figure
% # plot(0:10000, u, 'b')
% # hold on
% # plot(0:10000, y, 'r')
% # legend('u', 'y')
% # xlabel('k')
% # ylabel('u(k), y(k)')
% # title('Input and output')
% #
% # % Save data
% # csvwrite('input.csv', u)
% # csvwrite('output.csv', y)
