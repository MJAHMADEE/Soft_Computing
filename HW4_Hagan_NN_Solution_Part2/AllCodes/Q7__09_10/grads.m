function G = grads(x)
    X1 = 0.5, Y1 = 0.5;
    G(1) = -12*Y1 + 4*(X1 + Y1)^3 + 1;
    G(2) = -12*X1 + 4*(X1 + Y1)^3 + 1;
end