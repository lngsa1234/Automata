%author: Ling Wang
%function: calculate r=p^E(mod n)
%Parameters:
%      input:
%         P: the bae
%         exponential: E
%         n: modulus
%      output:
%         r: remainder

function [r]=modularexp(P,E,n)

%initial value
r2=1;
p=P;
e=E;

%repeat

while(e ~=0)
    Q=floor(e/2);
    R=mod(e,2);
    r1=mod(p^2,n);
    if(R==1)
        r2=mod(r2*p,n);
    end
    p=r1;
    e=Q;
end
r=r2;

