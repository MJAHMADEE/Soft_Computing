function Y = evaluation(P)
[x1 y1] = size(P);
H = zeros(1, x1);
for i = 1:x1
    A = bi2de(P(i,1:y1/2));
    x = -3+A*(3-(-3))/(2^(y1/2)-1);
    B = bi2de(P(i,y1/2+1:y1));
    y = -3+B*(3-(-3))/(2^(y1/2)-1);
    H(1, i) = 3*(1-x)^2*exp(-x^2 - (y+1)^2) ...
             -10*(x/5 - x^3 - y^5)*exp(-x^2 - y^2) ...
             -1/3*exp(-(x+1)^2 - y^2);
end
Y = H;