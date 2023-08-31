%El sistema Av=b para los voltajes es
A=[11,-5,0,0,0,-1;
    -20,41,-15,0,-6,0;
    0,-3,7,-4,0,0;
    0,0,-1,2,-1,0;
    0,-3,0,-10,28,-15;
    -2,0,0,0,-15,47];
disp('Matriz A del sistema Av=b:'); disp(A);
b=[5*50;0;0;0;0;0];
%Resolviendo para hallar los voltajes v
[L,U,P,condicion]=FACTOR(A);
[v]=SOLVE(L,U,P,b);
%Mostramos el resultado y el numero de condicion del sistema
disp ('Voltajes:'); disp(v);
disp('Condición del sistema:'); disp(condicion);
