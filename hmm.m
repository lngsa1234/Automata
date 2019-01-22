
% input
% Dry = 1; Dryish =2; Damp =3; Soggy =4
% input O

% the state transition matrix
A=[0.500, 0.250, 0.250;
   0.375, 0.125, 0.375;
   0.125, 0.675, 0.375];

% the confusion matrix
B=[0.60, 0.20, 0.15, 0.05;
   0.25, 0.25, 0.25, 0.25;
   0.05, 0.10, 0.35, 0.50];

%initial state probabilities
pi = [ 0.63 ; 0.17 ; 0.20];

% the obervation time
[ m n] =size(O);
T = n;
% the number of hidden states
[m n] = size(A);
M = m;
%the number of obervation states
[m n] = size(B);
N = n ;

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
P = sum(alpha(:,T));
PFORWAD = P
alpha

%viterbi algorithm
gama=zeros(M,T);
beta=zeros(M,T);
gama(:,1)= pi.*B(:,O(1));
Q=zeros(1,T);

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
[P F]= max(gama(:,T));
PVITERBI = P
gama
beta

Q(T)= F;
for i = 1:T-1
    j = Q(T+1-i);
    Q(T-i) = beta(j,T+1-i);
end
Q