%p1 = [1;4] t1 = 0
%p2 = [1;5] t2 = 0
%p3 = [2;4] t3 = 0
%p4 = [2;5] t4 = 0
%p5 = [3;1] t5 = 1
%p6 = [3;2] t6 = 1
%p7 = [4;1] t7 = 1
%p8 = [4;2] t8 = 1
function train_network(ps,ts)
W = [0 0];
b = 0;
not_converged = true;
% reshaped as one column vector
p3 = reshape(ps, numel(ps),1);
while not_converged
    index = 2;
    t = 1;
    count = 0; %counts number of correct results
    while(index < length(p3)+2) %+2 in order to reach last two inputs
        
        % take a pair of input
        disp('P test:');
        ptest = [p3(index-1);p3(index)];
        disp(ptest);
        
        % Current Stats:
        disp('Current Weigth:');
        disp(W);
        disp('Current Bias:');
        disp(b);
        
        a = hardlim(W * ptest + b);
        disp('Result:');
        disp(a);
        
        disp('Expected Result:');
        disp(ts(t));
        
        % if the result is not as expected 
        if a ~= ts(t)
            disp('***Correction***');
            % calculate error
            disp('Error:');
            e = ts(t) - a;
            disp(e);
            % calculate weight
            disp('New Weight:');
            W = W + (e * ptest');
            disp(W);
            % calculate new bias
            disp('New Bias:');
            b = b + e;
            disp(b);
            
        else
            % advance the count of correct answers
            count = count + 1;
            disp('Number of correct results');
            disp(count);
        end
        % advance indexes
        index = index + 2;
        t = t + 1;
        
        % check if the iteration is complete
        if index > length(p3) && count < length(ts)
        % reset indexes for another iteration
        disp('COUNT IS LESS THAN EXPECTED');
        index = 2;
        t = 1;
        count = 0;
        end
        
    end
not_converged = false;
end
end
