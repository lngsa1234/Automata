%author: Ling Wang
% 

function [x,fval,exitflag]=annealing(myfunc)

x1=randi([0,99],1,1);
y1=myfunc(x1);


for i=1:10
    T=100-(i-1)*10;
    for j=1:5
        x2=randi([0,99],1,1);
        y2=simplefunc(x2);
        p=exp(-(y2-y1)/T);
        if(p>1)
            x= x2;
            fval=y2;
            exitflag=1;
            return;
        end
    end

end
x=x2;
fval=y2;
exitflag=0;