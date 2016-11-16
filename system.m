function [Y,v] = system(x, g,k,d,n,a,b)
 v = zeros(n,1);
 h = (b-a)/(n-1);
 t = [0:h:b]';
 v = exp(x-t)-t.*x-((t-ones(n,1)*a).^g).*(ones(n,1).*b-t).*x;
 v(1) = x(1).^g+cos(x(1)+k)-1;
 v(n) = x(n).^3+(x(n)-k).^2/k -d;
 for i=2:(n-1)
     v(i) = v(i)+(1/(h^2))*(x(i-1)-2.*x(i)+x(i+1));
 end;
 Y = zeros(n,n);
 Y(1,1)=g.*x(1).^(g-1)-sin(x(1)+k);
 Y(n,n) = 3*x(n).^2+(2/k)*(x(n)-k);
 for i=2:(n-1)
     Y(i,i-1) = 1/h.^2;
     Y(i,i+1) = 1/h.^2;
     Y(i,i) = -2/h.^2-((t(i)-a).^g)*(b-t(i))+exp(-t(i)+x(i))-t(i);
 end
 return;
end
 
