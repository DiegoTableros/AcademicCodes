%Definimos las funciones
f=@(x1) 0.25*atan(20*(x1-1));
%Tolerancia
tol=input('Tolerancia: ');

%Numero de evaluaciones
eval=1;
max_eval=input('Max evaluaciones:');
%Evaluación inicial
xk=-0.5;
x=xk-f(xk);
%Iteración de punto fijo
while(abs(x-xk)>tol && eval<=max_eval)
    xk=x;
    x=xk-f(xk);
    eval=eval+1;
end
%Mostramos los resultados
disp('Resultado (normal):'); disp(x);
disp('No. de iteraciones:'); disp(eval);

%Graficación
a=-2.5; b=1.5;
equis=a:(b-a)/100:b;
y=f(equis);
plot(equis,y,'r-','linewidth',1); hold on;
plot(x,f(x),'k.','markersize',10);
grid on; axis square;