function Y = population(n)
% n = population size
 
% It is noted that the number of bits to represent the variables
% in binary numbers depends on the required accuracy (the number
% of digits after comma)
 
% In this example, I want the solution precision with 5 places after the
% decimal point, and with the upper and lower bounds of the variables are 3
% and -3, so, for each variable, we need 20 bits.
% General formula: 2^(m-1) < (upper bound - lower bound)*10^p < 2^m-1
% In this case: p = 5 and m = 20.
 
% We have 2 variables (x and y), so we need 40 bits in 
% total for binary encoding
Y = round(rand(n, 40));
