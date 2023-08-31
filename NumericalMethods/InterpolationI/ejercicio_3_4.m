%Introducimos los 6 puntos a interpolar (x_i,y_i)
x=[10;20;40;60;80;100];
y=[1.498;2.138;2.840;2.542;1.877;1.201];
%Generamos la matriz de Vandermonde en las variables x_i
V=fliplr(vander(x));
%Usamos FACTOS/SOLVE para solucionar el sistema V'c=y
[L,U,P,condicion]=FACTOR(V);
[c]=SOLVE(L,U,P,y);
%Mostramos el resultado, los coeficientes c_1,...,c_6
disp('Coeficientes c_i:'); disp(c);
%Mostramos el número de condición del sistema
disp('Número de condición del sistema:'); disp(condicion);

%Ahora evaluamos el polinomio interpolante con Horner,
x_restantes=[5;15;30;50;70;90];
y_restantes=[1.226;1.822;2.662;2.807;2.210;1.539];
y_evaluados=zeros(6,1); errores=zeros(6,1);
%Evaluamos p(x_restante(i)) para los 6 puntos no interpolados
for i=1:6
    res=c(6);
    for j=5:-1:1
        res=res*x_restantes(i)+c(j);
    end
    y_evaluados(i)=res;
    errores(i)=abs(res-y_restantes(i))/y_restantes(i);
end
disp('Polinomio interpolante evaluado en los x restantes:');
disp(y_evaluados);
disp('Errores relativos con respecto a los valores correctos:');
disp(errores);

%Graficamos p(x) en el intervalo [5,100]
x=5:0.1:100; y=zeros(1,length(x));
for i=1:length(x)
    res=c(6);
    for j=5:-1:1
        res=res*x(i)+c(j);
    end
    y(i)=res;
end
plot(x,y,'c-','linewidth',2);
xlabel('x'); ylabel('y'); axis square; legend('p(x)'); hold on;
for i=1:6
    plot(x_restantes(i),y_restantes(i),'.','markersize',15,...
        'HandleVisibility','off'); hold on;
end