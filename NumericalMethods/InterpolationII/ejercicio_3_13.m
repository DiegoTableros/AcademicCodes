%Numero m para generar n=2m+1 puntos, extremos del intervalo [a,b]
m=7; a=-1; b=1;
%Generamos nuestros puntos para interpolar f(x)=abs(x)
x_m=[-1:1/m:1]'; y_m=abs(x_m);
%Generamos nuestro conjunto de grande de puntos en [1,1]
x=[a:(b-a)/100:b]'; y_abs=abs(x);
equis=x; ye=y_abs;
plot(equis,ye,'k-','linewidth',2);
hold on; xlabel('x'); ylabel('y');
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
    error_absoluto=abs(y_abs(k)-y);
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
    error_absoluto=abs(y-y_abs(i));
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
    error_absoluto=abs(y-y_abs(i));
    if error_absoluto>error
        error=error_absoluto;
    end
end
disp('Máximo error absoluto de p(x)_2m+1 con Hermite:');
disp(error);
plot(equis,ye,'r--','linewidth',2); hold on;
legend('|x|','Lagrange, p_{2m+1}(x)','Vandermonde, p_{2m+1}(x)',...
    'Hermite, p_{2m+1}(x)');