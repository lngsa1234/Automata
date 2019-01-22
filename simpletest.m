


x=1:50;
y=1:50;
lamda=0.04;

% the size of the area
m=size(x);
n=size(y);

% the number of points
N = poissrnd(100);

% generate the nodes
points = unifrnd(1,50,N,2)
[PL, PM]=size(points);
px=points(:,1);
py=points(:,2);
plot(px,py,'o')
hold on

s = zeros(L,2);
r = zeros(L,2);
F = zeros(L,L);
G = zeros(L,L);
V = zeros(L,1);

L=10;
lamda = 2;
beta=2;
noise = 0.00022;

ps= randi(50,1,15)
pr= randi(50,1,15)

for i=1:15
    for j=i+1:15
        if(ps(j)==ps(i))
            ps(j)=-1;
        end
         if(pr(j)==pr(i))
            pr(j)=-1;
        end   
    end
end

%mark the points with the same sender and receiver
for i=1:15
    for j=1:15
        if(pr(i)==ps(j))
            pr(i)=-1;
        end
    end
end

%remove the points with the same sender and receiver
j=1;
for i=1:15
    if(ps(i)~=-1)
        ps(j)=ps(i);
        j=j+1;
    end;
end

j=1;
for i=1:15
    if(pr(i)~=-1)
        pr(j)=pr(i);
        j=j+1;
    end;
end

ps
pr
%pr= randi(50,1,L)
for i=1:L
    s(i,:)= points(ps(i),:);
    for j=1:PL
        d = sqrt((s(i,1)-points(j,1))^2+(s(i,2)-points(j,2))^2);  
        if(d<0.4&& d>0)
            r(i,:)=points(j,:);
            break;
        end 
    end
end
s
r

for i=1:L
x= [s(i,1) r(i,1)];
y= [s(i,2) r(i,2)];
plot(x,y,'-.r*')
end
hold off


for i=1:L
    for j=1:L
      d = sqrt((s(i,1)-r(j,1))^2+(s(i,2)-r(j,2))^2);  
      F(i,j)=1/d^lamda;
    end
end

for i=1:L
    for j=1:L
    G(i,j)=-beta*F(i,j)/F(i,i);
    end
    G(i,i) = 1;
end

for i=1:L
    V(i)= beta*noise/F(i,i);
end

F
G
V
    
n = L;
%m=8;n=8;
%A=randn(m,n)
%C=randn(m,m)
%b=randn(m,1)

%bnds = randn(n,2);
%l=min(bnds,[],2);
%u = max(bnds,[],2);
G.^-1
det(G)
x=G.^-1*V
cvx_begin
    variable x(n);
   % minimize (norm(x));
    subject to
        G*x >= V;
        x>0;
cvx_end

