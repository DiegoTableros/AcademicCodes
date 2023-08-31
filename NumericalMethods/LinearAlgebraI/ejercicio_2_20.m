format long;
%Introducimos el sistema de ecuaciones rigido
a=482317.0;
b=2196.05;
c=6708.43; 
A=[a,0,0,0,b,-b;0,a,0,-b,0,-b;0,0,a,b,b,0;
    0,-b,b,c,0,0;b,0,b,0,c,0;-b,-b,0,0,0,c];
b=[15;0;-15;0;25;0];
%Resolviendo Ax=b para x
[L,U,P,condicion]=FACTOR(A);
[x]=SOLVE(L,U,P,b);
%Mostramos la solución x junto con cond(A)
disp('x:'); disp(x);
disp('Número de condición de A:'); disp(condicion);