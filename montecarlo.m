%author: Ling Wang
% function: Monte Carlo algorithm to get the approximated value of pi
% Parameters:
%     input: 
%         N: the number of iterations
%     output:
%         pi: the approximated value


function [pi]=montecarlo(N)

%count
cnt=0;

%repeat
for i=1:N
    x=rand(1);
    y=rand(1);
    if(x^2+y^2<=1)
        cnt=cnt+1; 
    end
end

%get the value
pi=cnt/N*4;




