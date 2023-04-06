clear all
close all
clc

p = 100;
c = 30; 
m = 30; 
t = 250; 

figure 
xlabel('Generation')
ylabel('Func Value')
hold on
P = population(p);
K = 0;
[x1 y1] = size(P);
P1 = 0;
for i = 1:t
    Cr = crossover(P, c);
    Mu = mutation(P, m);
    P(p+1:p+2*c, :) = Cr;
    P(p+2*c+1:p+2*c+m, :) = Mu;
    E = evaluation(P);
    [P S] = selection(P, E, p);
    K(i, 1) = sum(S)/p;
    K(i, 2) = S(1);
    plot(K(:, 1), 'b.'); drawnow
    hold on
    plot(K(:, 2), 'r.'); drawnow
end
Max_fitness_value = max(K(:, 2))
P2 = P(1, :);
A = bi2de(P2(1,1:y1/2));
x = -3+A*(3-(-3))/(2^(y1/2)-1);
B = bi2de(P2(1, y1/2+1:y1));
y = -3 +B*(3-(-3))/(2^(y1/2)-1);
figure
[X,Y,Z] = peaks(25);
mesh(X,Y,Z)
Optimal_solution = [x y]