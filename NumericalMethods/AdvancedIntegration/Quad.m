function [q,e,nfe] = Quad(f,alpha,beta,nfe)
%  A Gauss-Kronrod (3,7) quadrature over (alpha,beta).

%Valores de A_1,A_2,A_3,A_4 y x_1,x_2,x_3
a = [0.2684880898683334, 0.1046562260264672, ...
     0.4013974147759622, 0.4509165386584744];
x = [0.7745966692414834, 0.9604912687080202, 0.4342437493468026];
%Evaluación de la cuadratura de Kronrod (solo las funciones)
h = (beta - alpha)/2;
center = alpha + h;
f1 = feval(f,center);
f2 = feval(f,center - h * x(1));
f3 = feval(f,center + h * x(1));
f4 = feval(f,center - h * x(2));
f5 = feval(f,center + h * x(2));
f6 = feval(f,center - h * x(3));
f7 = feval(f,center + h * x(3));
%Añadimos 7 evaluaciones de funciones al conteo general
nfe = nfe + 7;
%Calculamos la integral con cuadratura Gaussiana de tres puntos
q = h * (5 * (f2 + f3) + 8 * f1) / 9;
%Calculamos la integral con cuadratura Krondor de siete puntos
qkronrod = h*(a(1)*(f2+f3)+a(4)*f1+a(2)*(f4+f5)+a(3)*(f6+f7));
%El error es aproximadamente la diferencia entre una y otra
e = qkronrod - q;
