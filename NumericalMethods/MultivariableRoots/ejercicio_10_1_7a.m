%Definimos las funciones
g1=@(x2,x3) (cos(x2*x3)+0.5)/3;
g2=@(x1) (sqrt(x1^2+0.3125)/25)-0.03;
g3=@(x1,x2) -(exp(-x1*x2)/20)-((10*pi-3)/60);
%Tolerancia
tol=input('Tolerancia: ');

%SIN ACELERACIÓN Gauss-Seidel
%Evaluación inicial
xk=[0,0,0];
x=[g1(xk(2),xk(3)),g2(xk(1)),g3(xk(1),xk(2))];
%Numero de evaluaciones
eval=1;
%Iteración de punto fijo
while(norm(x-xk,'inf')>tol)
    xk=x;
    x=[g1(xk(2),xk(3)),g2(xk(1)),g3(xk(1),xk(2))];
    eval=eval+1;
end
%Mostramos los resultados
disp('Resultado (normal):'); disp(x);
disp('No. de iteraciones:'); disp(eval);

%CON ACELERACIÓN Gauss-Seidel
%Evaluación inicial
xk=[0,0,0]; x=zeros(1,3);
x(1)=g1(xk(2),xk(3));
x(2)=g2(x(1));
x(3)=g3(x(1),x(2));
%Numero de evaluaciones
eval=1;
%Iteración de punto fijo
while(norm(x-xk,'inf')>tol)
    xk=x;
    x(1)=g1(xk(2),xk(3));
    x(2)=g2(x(1));
    x(3)=g3(x(1),x(2));
    eval=eval+1;
end
%Mostramos los resultados
disp('Resultado (Gauss-Seidel):'); disp(x);
disp('No. de iteraciones:'); disp(eval);