%Definimos las funciones
g1=@(x1,x2) (x1.^2+x2.^2+8)./10;
g2=@(x1,x2) (x1.*x2.^2+x1+8)./10;
%Tolerancia
tol=input('Tolerancia: ');

%SIN ACELERACIÓN Gauss-Seidel
%Evaluación inicial
xk=[0,0];
x=[g1(xk(1),xk(2)),g2(xk(1),xk(2))];
%Numero de evaluaciones
eval=1;
%Iteración de punto fijo
while(norm(x-xk,'inf')>tol)
    xk=x;
    x=[g1(xk(1),xk(2)),g2(xk(1),xk(2))];
    eval=eval+1;
end
%Mostramos los resultados
disp('Resultado (normal):'); disp(x);
disp('No. de iteraciones:'); disp(eval);

%CON ACELERACIÓN Gauss-Seidel
%Evaluación inicial
xk=[0,0]; x=zeros(1,2);
x(1)=g1(xk(1),xk(2));
x(2)=g2(x(1),xk(2));
%Numero de evaluaciones
eval=1;
%Iteración de punto fijo
while(norm(x-xk,'inf')>tol)
    xk=x;
    x(1)=g1(xk(1),xk(2));
    x(2)=g2(x(1),xk(2));
    eval=eval+1;
end
%Mostramos los resultados
disp('Resultado (Gauss-Seidel):'); disp(x);
disp('No. de iteraciones:'); disp(eval);