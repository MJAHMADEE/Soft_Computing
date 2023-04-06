clf; clc; clear all; close all;

% Init min/max
xMax = 0.5;
xMin = -xMax;
difference = xMax-xMin;

% Init w1, b1, w2, b2

W1(:, 1) = xMin + rand(1, 10)*difference; % For the first layer (logsig)
B1(:, 1) = xMin + rand(1, 10)*difference; % The new values of the weights, biases will be added to each column

W2(1, :) =(xMin+rand(1,10)*difference)'; % For the second layer (purelin)
B2(1) = xMin + rand(1, 1)*(difference); % The new values of the weights, biases will be added to each row

i = 1;
learningRate = 0.01;

while (1)
for p = -2:0.01:2

% FEED-FORWARD PHASE

product = (W1(:, i).* p + B1(:, i)); % Compute activation for 1st layer
A1(:, i) = 1./(1+exp(-product));
A2(i) = W2(i, :)*A1(:, i) + B2(1); % Compute activation for 2nd layer

% COMPUTE ERROR THROUGH THE COST FUNCTION

error = 1 + sin(p * (pi/2)) - A2(i);

% BACKPROPAGATION PREPARATION

% Compute derivative for 1st activation, compute sensitivities
derivative =[];
for row = 1:10
element = (1-A1(row,i))*A1(row,i);
derivative = [derivative element];
end
R = diag(derivative);

s2 = -2 * 1 * error;

s1 = R * W2(i, :)' *s2;

% UPDATE WEIGHTS AND BIASES

W1(:, i+1) = W1(:, i) - learningRate * s1 * p;
B1(:, i+1) = B1(:, i) - learningRate * s1;

W2(i+1, :) = W2(i, :) - learningRate * s2 * A1(:,i)';
B2(i+1) = B2(i) - learningRate * s2;

figure(1);
plot(p, error,'*b');
hold on;
xlabel('p');
ylabel('error');
legend('error');

figure(2);
plot(p, A2(i),'*g');
hold on;
xlabel('p');
ylabel('A2');
legend('A2');

figure(3)
plot(p,1 + sin(p*(pi/2)),'*r');
hold on;
xlabel('p');
ylabel('1 + sin(p*pi/2)');
legend('1 + sin(p*pi/2)');

i = i + 1;

end

if (abs(error) < 0.01 || i<1500)
return % End if absolute error is smaller than the predefined threshold
end

end