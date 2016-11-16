function [y]  = tridiagonalMatrixSolver(B,z)
A = B;
x = z;
n = size(A);
n = n(1);
y = zeros(n,1);
alpha = zeros(n,1);
beta = alpha;
alpha(2) = -A(1,2)/A(1,1);
beta(2) = x(1)/A(1,1);
for i =2:n-1
    alpha(i+1) = -A(i-1,i)/(A(i,i)+A(i,i-1)*alpha(i));
    beta(i+1) = (-A(i,i-1)*beta(i)+x(i))/(A(i,i)+A(i,i-1)*alpha(i));
end
i = n;
y(i)=(-A(i,i-1)*beta(i)+x(i))/(A(i,i)+A(i,i-1)*alpha(i));
for i=(n-1):-1:1
    y(i)=alpha(i+1)*y(i+1)+beta(i+1);
end    
return
end