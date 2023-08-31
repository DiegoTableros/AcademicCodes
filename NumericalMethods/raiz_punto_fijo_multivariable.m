%Este programa soluciona sistemas de la forma
% x1 = g(x1,x2,x3)
% x2 = g(x1,x2,x3)
% x3 = g(x1,x3,x3)

%Definimos las funciones
g1=@(x1,x2) (1+1/(log(3*x1-1)+9/(4*0.9*x1)+1/(3*x2-1)-log(3*x2-1)-9/(4*0.9*x2)))/3;
g2=@(x2,x3) sqrt(3*(1/((8*0.9)/(3*x2-1)-x3)));
g3=@(x1) (8*0.9/(3*x1-1))-(3/(x1*x1));
%Tolerancia
tol=input('Tolerancia: ');

%SIN ACELERACIÓN Gauss-Seidel
%Evaluación inicial
xk=[0.603,2.348,0.647];
x=[g1(xk(1),xk(2)),g2(xk(2),xk(3)),g3(xk(1))];
%Numero de evaluaciones
eval=1;
%Iteración de punto fijo
while(norm(x-xk,'inf')>tol)
    xk=x;
    x=[g1(xk(1),xk(2)),g2(xk(2),xk(3)),g3(xk(1))];
    eval=eval+1;
end
%Mostramos los resultados
disp('Resultado (normal):'); disp(x);
disp('No. de iteraciones:'); disp(eval);

% %CON ACELERACIÓN Gauss-Seidel
% %Evaluación inicial
% xk=[0,0.1,0.8]; x=zeros(1,3);
% x(1)=g1(xk(1),xk(2),xk(3));
% x(2)=g2(x(1),xk(3));
% x(3)=g3(x(1),x(2));
% %Numero de evaluaciones
% eval=1;
% %Iteración de punto fijo
% while(norm(x-xk,'inf')>tol)
%     xk=x;
%     x(1)=g1(xk(1),xk(2),xk(3));
%     x(2)=g2(x(1),xk(3));
%     x(3)=g3(x(1),x(2));
%     eval=eval+1;
% end
% %Mostramos los resultados
% disp('Resultado (Gauss-Seidel):'); disp(x);
% disp('No. de iteraciones:'); disp(eval);