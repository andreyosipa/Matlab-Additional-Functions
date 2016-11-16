function [ e kit ] = max_eig( A , x , eps , mki )
%MAX_EIG This function returns [ e kit ] - e is maximum eigen value of
%matrix A and kit is number of iterations performed to find it.
%Input [ A x eps mki ]. A is matrix, x is starting value for first
%iteration, eps is needed accuracy and mki is maximum number of iterations
%to find the eigen value.
kit = 0;
x_new = x + eye(length(x),1);
while (norm(x-x_new,Inf)>eps) && (kit < mki)
    x = x_new;
    x = (x/norm(x,2));
    x_new = A*(x);
    kit = kit + 1;
end;
e = norm(x_new , 2)/norm(x,2);
return
end

