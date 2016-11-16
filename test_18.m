function [ y , accuracy ] = test_18(  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
X=zeros(1,11);
Y=zeros(11,1);
%Y=Y';
Z=zeros(1,11);
a=0;
b=1;
d=13;
k=17;
h=b/10;
for i=1:1:11 
    X(i)=(i-1)*h
end
A=[0,0,0,0,0,0,0,0,0,0,0];
B=[0,0,0,0,0,0,0,0,0,0,0];

for i=1:50
    W=zeros(11);
    for j=2:1:10
        W(j,j-1)=100;
        W(j,j+1)=100;
        W(j,j)=-2/(h^2)-(X(j)-a)*(b-X(j))+exp(Y(j)-X(j))-X(j);
    end
    W(1,1)=1-sin(Y(1)+k);
    W(11,11)=3*(Y(11)^2)+2*(Y(11)-k)/k;
    
    %A(2)=-W(1,2)/W(1,1);
    %B(2)=Y(1)+cos(Y(1)+k)/W(1,1);
    %for i=2:1:10
    %    A(i+1)=-100/(W(i,i)+100*A(i));
    %    B(i+1)=(-100*B(i)+(Y(i-1)-2*Y(i)+Y(i+1))/(h*h)-X(i)*(b-X(i))*Y(i)+exp(Y(i)-X(i))-X(i)*Y(i))/(W(i,i)+100*A(i));
    %end
    %Z(11)=(Y(11)*Y(11)*Y(11))+(Y(11)-k)*(Y(11)-k)/k-d;
    %for m=10:-1:1
    %    Z(m)=A(m+1)*Z(m+1)+B(m+1);
    %end
    %Y=Y-(-1)*Z;
    
    U(1)=1+cos(Y(1)-k)-1;
    U(11)=Y(11)^3+(Y(11)-k)^2/k-d;
    U=zeros(11,1);
    for i=2:10
        U(i)=1/h^2*(Y(i-1)-2*Y(i)+Y(i+1))-(X(i)-a)*(b-X(i))*Y(i)+exp(Y(i)-X(i))-X(i)*Y(i);
    end;
    accuracy = max(abs(U))
    Y=Y-progon(W,U);
    
end
return
end

