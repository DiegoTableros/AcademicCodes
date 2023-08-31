%Definimos nuesta tolerancia absoluta y relativa
ABSERR=1e-8; RELERR=1e-6;
%Definimos nuestros valores de x=0,0.1,...,0.5
x=0:0.1:0.5; y=x;
%Definimos la función del integrando
f=@(t) exp(t.^2);
%Calculamos las integrales iterativamente
for i=2:length(x)
    %Integramos en [x(i)-0.1,x(i)]
    a=x(i)-0.1; b=x(i);
    %Integramos con ADAPT
    [res,error,flag,no_eval]=Adapt(f,a,b,ABSERR,RELERR);
    %Guardamos y sumamos la integral anterior sobre [0,x(i)-0.1]
    y(i)=res+y(i-1);
end
%Finalmente multiplicamos cada resultado por su correspondiente constante
y=exp(-(x.^2)).*y;
%Mostramos los resultados
disp('Valores de (x,y(x)) calculados'); disp(x); disp(y);

%Grafica bonita
plot(x,y,'linewidth',1); hold on;
plot(x(1:6),y(1:6),'k.','markersize',10,'handlevisibility','off')
maxy=max(y); miny=min(y);
axis([0,0.5,min(0,miny+0.5*miny),maxy+0.5*maxy]); grid on; grid minor;
xlabel('x'); ylabel('y'); legend('y(x)');