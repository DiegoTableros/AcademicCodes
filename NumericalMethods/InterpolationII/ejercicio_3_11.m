%Numero m para generar n=2m+1 puntos, extremos del intervalo [a,b]
m=13; a=-5; b=5;
%Generamos nuestros puntos para interpolar en la f. de Runge
x_m=[-5:5/m:5]'; y_m=1./(1.+x_m.^2);
%Generamos nuestro conjunto de grande de puntos en [-5,5] en la f. Runge
x=[a:(b-a)/100:b]'; y_runge=1./(1.+x.^2);
equis=x; ye=y_runge;
plot(equis,ye,'k-','linewidth',2);
hold on; axis square; xlabel('x'); ylabel('y');
%INTERPOLACIÓN DE LAGRANGE PARA LOS 2m+1 PUNTOS
error=0;
for k=1:length(x)
    y=0;
    %Evaluando en el polinomio de Lagrange p_2m+1(x)
    for i=1:length(y_m)
        termino=y_m(i);
        for j=1:length(x_m)
            if i~=j
                termino=termino*((x(k)-x_m(j))/(x_m(i)-x_m(j)));
            end
        end
        y=y+termino;
    end
    ye(k)=y;
    %Actualizamos el error más grande si es que lo es
    error_absoluto=abs(y_runge(k)-y);
    if error_absoluto>error
        error=error_absoluto;
    end
end
disp('Máximo error absoluto de p(x)_2m+1 con Lagrange:');
disp(error);
plot(equis,ye,'b:','linewidth',2); hold on;

%INTERPOLACIÓN DE VANDERMONDE PARA LOS 2m+1 PUNTOS
%Generamos la matriz de Vandermonde para los puntos interpolados
A=fliplr(vander(x_m));
%Resolvemos el sistema Ac=y_m para obtener los coeficientes de p_2m+1(x)
[L,U,P]=lu(A); aux=L\(P*y_m); c=U\aux; c=flip(c);
%Los coeficientes de p_2m+1(x) están en c, computamos el error
error=0;
for i=1:length(x)
    y=polyval(c,x(i));
    ye(i)=y;
    error_absoluto=abs(y-y_runge(i));
    if error_absoluto>error
        error=error_absoluto;
    end
end
disp('Máximo error absoluto de p(x)_2m+1 con Vandermonde:');
disp(error);
plot(equis,ye,'g-.','linewidth',2); hold on;

%INTERPOLACIÓN CÚBICA DE HERMITE PARA LOS 2m+1 PUNTOS
%Usamos la función pchip para interpolar (x_m,y_m)
c=pchip(x_m,y_m);
%Actualmente en c están los coeficientes del polinomio interpolante
error=0;
for i=1:length(x)
    y=ppval(c,x(i));
    ye(i)=y;
    error_absoluto=abs(y-y_runge(i));
    if error_absoluto>error
        error=error_absoluto;
    end
end
disp('Máximo error absoluto de p(x)_2m+1 con Hermite:');
disp(error);
plot(equis,ye,'r--','linewidth',2); hold on;
legend('1/(1+x^2)','Lagrange, p_{2m+1}(x)','Vandermonde, p_{2m+1}(x)',...
    'Hermite, p_{2m+1}(x)');