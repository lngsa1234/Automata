%Author: Ling Wang
%function: convert binary array into integer
%parameters:
%        input  x: mXn arra, each entry is 1 or 0 
%        output y: mx1 array

function [y]=bina2int(x)
[m,n]=size(x);
y=zeros(m,1);
for i=1:m
    tmp=0;
    for j=1:n
        tmp=tmp+x(i,j)*(2.^(n-j));
    end
    y(i,1)=tmp;
end