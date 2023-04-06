function E412(p, t)
error = 1;
W = [rand rand; rand rand];
b = [rand rand]';
count = 0;
while (error ~= 0 & count<=50)
   count = count + 1;
      error = 0;
   for i = 1 : 8
      a = hardlim(W * p(:, i) + b);
      e = t(:, i) - a;
      newW = W + e * p(:, i)';
      W = newW;
      b = b + e;
      if (~isequal(e, [0, 0]'))
         error = error + 1;
      end
   end
end
if error ~=0 
      fprintf('Program terminated with no satisfying weight or bias after 50 iterations.\n');
      return;
end

W
b

figure
hold on

plot(p(1,1), p(2,1), 'r*');
plot(p(1,2), p(2,2), 'r*');
plot(p(1,3), p(2,3), 'g*');
plot(p(1,4), p(2,4), 'g*');
plot(p(1,5), p(2,5), 'b*');
plot(p(1,6), p(2,6), 'b*');
plot(p(1,7), p(2,7), 'c*');
plot(p(1,8), p(2,8), 'c*');

x = -3:1:3;
y = -(W(1,1) * x + b(1)) / W(1,2);
plot(x, y);
x = -3:1:3;
y = -(W(2,1) * x + b(2)) / W(2,2);
plot(x, y);