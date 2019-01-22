clc
% test 1

N = 10000;
%L =round(rand (1,N)*N);
L=randi([0,N-1],1,N);
tic;
Q = quicksort(L,1,N);
toc;
tic;
RQ =rquicksort(L,1,N);
toc;

N = 100000;
L=randi([0,N-1],1,N);
tic;
Q = quicksort(L,1,N);
toc;

tic;
RQ = rquicksort(L,1,N);
toc;
