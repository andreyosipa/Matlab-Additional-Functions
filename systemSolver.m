function [y, step] = systemSolver(g,k,d,n,a,b,x_st,eps,msteps)
step=0; 
diff=100;
x_curr=x_st;
while ((eps<diff) & (step<msteps))
    [Y,v] = system(x_curr, g,k,d,n,a,b);
    x_next = x_curr-progon(Y,v);
    diff = norm(x_next-x_curr);
    x_curr=x_next;
    step=step+1;
end;
y=x_curr;
return
end