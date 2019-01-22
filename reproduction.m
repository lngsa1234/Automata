%author:Ling Wang
%function: select one element from an array
%parameters;
%        input x: fitness value 1xn
%        output y: the ith number

function [y]=reproduction(x);

n =size(x,2);


%sum
sum=0;
for i=1:n
    sum=sum+x(i);
end

%contribution
% the larger the value, the smaller the contribution
c=zeros(1,n);
for i=1:n
    c(i)=round((sum-x(i))/sum*n);
end

% sort 
for i=1:n
    for j=i+1:n
    if(c(j)>c(i))
        tmp =c(i);
        c(i)=c(j);
        c(j)=tmp;
    end
    end
end

%sum
sum=0;
for i=1:n
    sum=sum+c(i);
end


%select the point
point=randi([1,sum],1,1);

partial=0;
i=0;
while((partial<=point)&&(i<n))
    i=i+1;
    partial=partial+c(i);
end
y=i;