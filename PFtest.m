%function q=PFtest(A,p,n)

function B=PFtest(A,p,n)

B=zeros(3,n);
B(:,1)=p;
for i=1:n
    p=A*p;
    B(:,i+1)=p;
end
X=B(1,:);
Y=B(2,:);
Z=B(3,:);

plot3(X',Y',Z','--');
