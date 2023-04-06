clc
clear all
close all

nVar = 10;
VarMin = -3;
VarMax = 3;

MaxIter = 150; % Max Num of Iters
nPop = 50; % Population Size
w = 1; % Inertia
d = 0.99; % Damping Ratio
c1 = 2; % Acceleration 1
c2 = 2; % Acceleration 2

x0.position = [];
x0.velocity = [];
x0.fitness = [];
x0.best.position = [];
x0.best.fitness = [];
x = repmat(x0, nPop, 1);
global_best.fitness = -inf;

for i = 1:nPop
    x(i).position = unifrnd(VarMin, VarMax, [1 nVar]);
    x(i).velocity = zeros([1 nVar]);
    x(i).fitness = Func(x(i).position);
    x(i).best.position = x(i).position;
    x(i).best.fitness = x(i).fitness;
    if x(i).best.fitness > global_best.fitness
        global_best = x(i).best;
    end
end
B = zeros(MaxIter, 1); % Save the best
for j = 1:MaxIter
    for i = 1:nPop
        x(i).velocity = w*x(i).velocity + c1*rand([1 nVar]).*(x(i).best.position - x(i).position) + c2*rand([1 nVar]).*(global_best.position - x(i).position); % update velocity
        x(i).position = x(i).position + x(i).velocity;
        x(i).fitness = Func(x(i).position);
        if x(i).fitness > x(i).best.fitness
            x(i).best.position = x(i).position;
            x(i).best.fitness = x(i).fitness;
            if x(i).best.fitness > global_best.fitness
                global_best = x(i).best;
            end
           
        end
    end
    w = w*d;
    disp(['Iteration' num2str(j) ':Best fitness = ' num2str(B(j))]);
    disp(['Best solution = ' num2str(global_best.position)]);
    disp(['Best fitness = ' num2str(global_best.fitness)]);
%     figure(1)
%     plot(B, 'r.'); drawnow
%     xlabel('Iteration');
%     ylabel('Best fitness');
%     title('PSO');
%     grid on
end