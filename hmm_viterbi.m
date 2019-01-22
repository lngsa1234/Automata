
% author: Ling Wang
% function:viterbi algorithm, obtain the mostly linke sate for a sequence of observations
% parameters:
%       input: 
%           pi: the intial probabity of the states
%           A : the state transition probability
%           B : the confision probability
%           O : the sequence of observations
%       output:
%           p : the probabity of the mostly states
%           S : the sequence of states

function [p,S]=hmm_viterbi(pi,A,B,O)

% the obervation time
T=size(O,2);

% the number of hidden states
M=size(A,2);

%the number of obervation states
N=size(B,2);


%viterbi algorithm
gama=zeros(M,T);
beta=zeros(M,T);
S=zeros(1,T);

%initial 
gama(:,1)= pi.*B(:,O(1));

%repeat
for t = 2:T
    for i = 1: M
    for j = 1: M
        temp = gama(j,t-1)*A(j,i);
        if(temp >gama(i,t) )
            gama(i,t) = temp;
            beta(i,t) = j;
        end
    end
    gama(i,t) = gama(i,t)*B(i,O(t));
    end
end

[p f]= max(gama(:,T));

% track the mostly states
S(T)= f;
for i = 1:T-1
    j = S(T+1-i);
    S(T-i) = beta(j,T+1-i);
end
