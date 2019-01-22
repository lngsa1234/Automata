%author: Ling Wang
%function : change 0 to 1 or change 1 to 0 by a probability
% parameters:
%    input alpha: 0 or 1
%         pro: example: 0.006
%    output beta: 0 or 1

function [beta]=mutation(alpha,pro)

 pro=pro*10000;
 pro=round(pro);
 r =randi([1,10000],1,1);
 
 if(r==pro)
     if(alpha==0)
         beta=1;
     else if(alpha==1)
         beta=0;       
     else
         beta=alpha;
         end
     end
 else
     beta=alpha;
 end
 
 
