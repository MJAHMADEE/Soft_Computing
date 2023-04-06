function [YY1 YY2] = selection(P, F, p)
[x y] = size(P);
Y1 = zeros(p, y);
F = F + 10;
e = 3;
for i = 1:e
    [r1 c1] = find(F==max(F));
    Y1(i, :) = P(max(c1), :);
    P(max(c1), :) = [];
    Fn(i) = F(max(c1));
    F(:, max(c1)) = [];
end
D = F/sum(F);
E = cumsum(D);
N = rand(1);
d1 = 1;
d2 = e;
while d2 <= p-e
    if N <= E(d1)
        Y1(d2+1, :) = P(d1, :);
        Fn(d2+1) = F(d1);
        N = rand(1);
        d2 = d2 + 1;
        d1 = 1;
    else
        d1 = d1 + 1;
    end
end
YY1 = Y1;
YY2 = Fn - 10;
end