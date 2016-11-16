function [ x ] = tridiagMatrixSolver( A , d )
n = length(A(1,:));
c = zeros(n,1);
b = zeros(n,1);
a = zeros(n,1);
c_new = zeros(n,1);
d_new = zeros(n,1);
c(1) = A(1,2);
a(n) = A(n,n-1);
b(n) = A(n,n);
b(1) = A(1,1);
c_new(1) = c(1)/b(1);
d_new(1) = d(1)/b(1);
for i=2:(n-1)
    c(i) = A(i,i+1);
    b(i) = A(i,i);
    a(i) = A(i,i-1);
    c_new(i) = c(i)/(b(i)-a(i)*c_new(i-1));
    d_new(i) = (d(i)-a(i)*d_new(i-1))/(b(i)-c(i)*c_new(i-1));
end;
d_new(n) = (d(n)-a(n)*d_new(n-1))/(b(n)-c(n)*c_new(n-1));
x = zeros(n,1);
x(n) = d_new(n);
for i=(n-1):-1:1
    x(i) = d_new(i) - c_new(i)*x(i+1);
end;
return;
end

