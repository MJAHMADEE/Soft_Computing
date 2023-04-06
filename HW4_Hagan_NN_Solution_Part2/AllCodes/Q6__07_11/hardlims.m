function [ a ] = hardlims( n )
%   hardlims Symmetric Hard Limit transfer function
%   Accepts column vector. Returns column vector.
%   behaves like unit step of amplitude 2 and vertical offset of -1
%   a = -1 for n < 0
%   a =  1 for n >= 0
    dims = size(n);
    a = zeros(dims);
    for i = 1:dims(1)
        for j = 1:dims(2)
            if n(i,j) < 0
                a(i,j) = -1;
            else
                a(i,j) = 1;
            end
        end
    end
end