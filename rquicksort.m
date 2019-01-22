%random quick sort
% pivot is a random value


function [L]=rquicksort(L,p,r)

if(p<r)
    [L q] = partition(L, p,r);
    L = quicksort(L,p,q-1);
    L = quicksort(L,q+1,r);
end

function [L q]= partition (L,p,r)
   
    % pivot is the middle element of the subset
    % swap the pivot with the last element
    %l = round(rand(1)*(r-p))+p;
    l=randi([p,r],1,1);
    pivot = L(l);
    [L(l) L(r)] = swap(L(l), L(r));
   
    % sort the subset L(p,r)
    % the elements before i is less than the pivot;
    % the elements after i is larger than the pivot.
    i = p-1;
    for j=p:r-1
        if(L(j)< pivot)
            i = i+1;
            [L(i) L(j)] = swap(L(i), L(j));
           
        end
    end
    [L(i+1) L(r)] = swap(L(i+1), L(r));
    
    % return the postion of the pivot after sorting.
    q = i+1;
end

function [x y] = swap(x,y)
    t = x;
    x = y;
    y = t;
end

end
    




