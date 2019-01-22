% Aunthor: Ling Wang
% Function: calculte the minimum value by genetic 
% Parameters:
%         input  fitfunc: fitness function
%                     m: number of population
%                     n: number of bits


function [x, fval] = minGA(fitfunc, m, n)


%generate the initial population
A=zeros(m,n);
for i=1:m
    for j=1:n
        A(i,j)=randi([0 1],1,1);
    end
end

% B is the representive of intergers;
% F stores the fitness
% C stores the contribution values
B=zeros(m,1);
F=zeros(m,1);
NEXT=zeros(m,n);

%repeat
count=0;
exitflag=0;
min=+Inf;
B=bina2int(A);
F=simplefunc(B);
pcnt=1;   

while((count<10)||(exitflag==0))
    
    %get the next generation
    for j=1:2:m-1
        % select parent
        parent1=reproduction(F');
        parent2=reproduction(F');
        
        % crossover and get the child
        [child1, child2]=crossover(A(parent1,:),A(parent2,:));
       
        
        % store the next generation
        NEXT(j,:)=child1;
        NEXT(j+1,:)=child2;
    end
    A=NEXT;
    
    %calculate fitness
    B=bina2int(A);
    F=simplefunc(B);
    fprintf(' The %d generation\n',pcnt);
    for i=1:m
        for j=1:n
            fprintf('%d ',A(i,j));
        end
        fprintf('%d\n',F(i,1));
    end
    
    %test if getting the lower E(x)
    tmp=Inf;
    p=0;
    for i=1:n
        if(F(i,1)<tmp)
            tmp=F(i,1);
            p=i;
        end
    end
    pcnt = pcnt+1;
    % if get the minimum value 0,return 
    if(tmp==0)
        p
        x=bina2int(A(p,:))
        fval=tmp;
        return;
    end
    
    % if the minimum value is larger then before, continue 10 times and
    % then exit
    if(tmp>=min)
        exitflag=1;
        fprintf(' get bigger value\n');
    else
        min=tmp;
    end 
    if(exitflag==1)
        count=count+1;
    end
end

%mutation
prob=0.001;
for i=1:n
    k=randi([1,n],1,1);
    A(i,k)=mutation(A(i,k),prob);
end

% the final processing
B=bina2int(A);
F=simplefunc(B);
for j=1:2:n-1
        % select parent
        parent1=reproduction(F');
        parent2=reproduction(F');
        
        % crossover and get the child
        [child1,child2]=crossover(A(parent1,:),A(parent2,:));
        
        
        % store the next generation
        NEXT(j,:)=child1;
        NEXT(j+1,:)=child2;
end

%get the minimal value
tmp=+Inf;
for i=1:n
    if(F(i,1)<tmp)
        tmp=F(i,1);
        p=i;
    end
end
p;
x=bina2int(A(p,:));
fval=tmp;

