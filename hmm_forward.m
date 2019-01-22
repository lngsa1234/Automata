
% author: Ling Wang
% function: obatin the probality of a sequence observation
% Parameters:
%       input :
%             pi: the initail probability of hidden states
%             A : the state transition matrix
%             B : the confusion matrix
%             O : the sequcen of observation
%       output :
%             p: the probability of a sequence

function [p]=hmm_forward(pi,A,B,O)

% the obervation time
T =size(O,2);

% the number of hidden states
M = size(A,2);

%the number of obervation states
N = size(B,2);

%forward algorithm
alpha =zeros(M,T);
alpha(:,1)= pi.*B(:,O(1));

for t = 2:T
    for i = 1: M
    for j = 1: M
        alpha(i,t) = alpha(i,t) + alpha(j,t-1)*A(j,i);
    end
    alpha(i,t) = alpha(i,t)*B(i,O(t));
    end
end
p = sum(alpha(:,T));


