% test the result of training 
function test_result(ps,ts)
W = [2 -3];
b = 0;

p3 = reshape(ps, numel(ps),1);
    index = 2;
    t = 1;
    count = 0;
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
        else 
            count = count + 1;
        end
        
        % advance indexes
        index = index + 2;
        t = t + 1;
    end
    disp('Number of correct answers:');
    disp(count);
    disp('Out of possible:');
    disp(length(ts));
end