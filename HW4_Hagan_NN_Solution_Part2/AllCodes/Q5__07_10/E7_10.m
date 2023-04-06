clc
clear all
close all

P = [1 1; 1 -1];
p1 = [1; 1];
p2 = [1; -1];
T = [1 -1];

Wh = T * P'
PPseudoinverse = inv(P'*P)*P'
W = T * pinv(P)

a1h = Wh*p1
a1p = W*p1