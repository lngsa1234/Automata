

n=4;
C=[2; 4; 1 ;2;];
A=[3 8 16 4
   6 46 9 9
   20 5 4 0];
b=[10000;2000;5000];
B=[A b]
rank(B);

D=[3 8 16
    6 46 9 
    20 5 4];
M= D^-1*b

L= zeros(4,1);

linprog(C,[],[],A,b,L,+Inf)


cvx_begin
    variable X(n);
   minimize (C'*X);
    subject to
        A*X == b;
        X >= 0;
cvx_end