%author: Ling Wang
%function: exchange part elements between two binary array
%parameters:
%        input x1,x2: 1xn binary array
%        output y1,y2: 1xn binary array

function [y1 y2]=crossover(x1,x2)

%get the length of the variable
n=size(x1,2);

y1=zeros(1,n);
y2=zeros(1,n);

%get k randomly
k=randi([1,n-1],1,1);

%copy the part befor k
for i=1:k
    y1(i)=x1(i);
    y2(i)=x2(i);
end

%exchange the part after k
for i=k+1:n
    y1(i)=x2(i);
    y2(i)=x1(i);
end