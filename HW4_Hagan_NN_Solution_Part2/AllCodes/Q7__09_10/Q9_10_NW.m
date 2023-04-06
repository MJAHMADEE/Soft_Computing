clc 
clear all 
close all

%plot the function contour lines
[X,Y] = meshgrid(-1 : .1 : 1);
Z = (X+Y).^4 - 12*X.*Y + X + Y + 1;
N = 10;
figure;
contour(X, Y, Z, N), title('Newton''s Method Trajectory for X_0 = [0 0]');
hold on;

G = zeros(2,1);
A = zeros(2);
x = [0.5 0.5]';   %Initialize x
% G = grad(x);
G(1) = 4*(x(1)+x(2))^3 - 12*x(2) + 1;
G(2) = 4*(x(1)+x(2))^3 - 12*x(1) + 1;
% G = jacobian(Z,x)
% G = [-12*Y + 4*(X + Y)^3 + 1; -12*X + 4*(X + Y)^3 + 1]
% A = hessian(x);
A(1,1) = 12*(x(1) + x(2))^2; A(1,2) = 12*((x(1) + x(2))^2 - 12);
A(2,1) = 12*((x(1) + x(2))^2 - 12); A(2,2) = 12*(x(1) + x(2))^2;
% A = jacobian(G,x);
% A = [12*(X + Y)^2  12*((X + Y)^2 - 1); 12*((X + Y)^2 - 1), 12*(X + Y)^2]
dx = [1e2 1e2]';
small = [1.0e-3,1.0e-3]';

%Find the stationary point
while (abs(dx(1)) >= small(1) | abs(dx(2))>= small(2))
   plot(x(1), x(2),'k.')
   old = x;
   x = x - inv(A).*G;
   dx = x - old;
%    G = grad(x);
   G(1) = 4*(x(1)+x(2))^3 - 12*x(2) + 1;  G(2) = 4*(x(1)+x(2))^3 - 12*x(1) + 1;
   %G = [-12*Y + 4*(X + Y)^3 + 1; -12*X + 4*(X + Y)^3 + 1]
%    A = hessian(x);
   A(1,1) = 12*(x(1) + x(2))^2; A(1,2) = 12*((x(1) + x(2))^2 - 1);
   A(2,1) = 12*((x(1) + x(2))^2 - 1); A(2,2) = 12*(x(1) + x(2))^2;
   %A = [12*(X + Y)^2  12*((X + Y)^2 - 1); 12*((X + Y)^2 - 1), 12*(X + Y)^2]
end
x
plot(x(1), x(2),'ro')  