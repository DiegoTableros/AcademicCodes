%Introducimos los 6 puntos a interpolar (x_i,y_i)
x_r=[5;10;15;20;30;40;50;60;70;80;90;100];
y_r=[1.226;1.498;1.822;2.138;2.662;2.840;...
    2.807;2.542;2.210;1.877;1.539;1.201];
%Generamos la matriz de Vandermonde en las variables x_i
V=fliplr(vander(x_r));
%Usamos FACTOS/SOLVE para solucionar el sistema V'c=y
[L,U,P,condicion]=FACTOR(V);
[c]=SOLVE(L,U,P,y_r);
%Mostramos el resultado, los coeficientes c_1,...,c_12
disp('Coeficientes c_i:'); disp(c);
%Mostramos el número de condición del sistema
disp('Número de condición del sistema:'); disp(condicion);

%Evaluamos y graficamos el polinomio interpolante en [5,100]
x=5:0.1:100; y=zeros(1,length(x));
for i=1:length(x)
    %Evaluación por el algoritmo de Horner
    res=c(12);
    for j=11:-1:1
        res=res*x(i)+c(j);
    end
    y(i)=res;
end
plot(x,y,'g-','linewidth',2); xlabel('x'); ylabel('y'); legend('p(x)');
axis square; axis([0,105,1,3]); hold on;
%Graficamos los puntos interpolados
for i=1:12
    plot(x_r(i),y_r(i),'.','markersize',15,'HandleVisibility','off');
    hold on;
end