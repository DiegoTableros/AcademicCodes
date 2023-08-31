%Definimos nuesta tolerancia absoluta y relativa
ABSERR=1e-8; RELERR=1e-6;
%Intervalo de integración [a,b]
a=0; b=pi;
x=input('x:');
%Definimos la función
f=@(t) (1/pi).*(cos(x.*sin(t)));

%Integramos con ADAPT
[res,error,flag,no_eval]=Adapt(f,a,b,ABSERR,RELERR);
disp('Integral provista por Adapt:');
disp(res);
disp('Error de Adapt, Bandera y NoDeEvaluaciones hechas:');
disp([error;flag;no_eval]);

%Grafica bonita
equis=[a:(b-a)/1000:b]';
plot(equis,f(equis)); hold on;
area(equis,f(equis),'facecolor','m'); hold on;
maxy=max(f(equis)); miny=min(f(equis));
axis([a,b,min(0,miny+0.5*miny),maxy+0.5*maxy]); grid on;
xlabel('x'); ylabel('y');
legend('J_0','Integral');