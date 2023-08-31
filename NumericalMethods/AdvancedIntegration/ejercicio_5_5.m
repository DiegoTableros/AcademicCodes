%Definimos nuesta tolerancia absoluta y relativa
ABSERR=1e-12; RELERR=1e-6;
%Intervalo de integración [a,b]
a=0; b=1/38; c=38;
%Definimos la función
f=@(x) c.*(1+(sin(38*pi.*x)).^2);

%Integramos con ADAPT
[res,error,flag,no_eval]=Adapt(f,a,b,ABSERR,RELERR);
disp('Integral provista por Adapt:');
disp(res);
disp('Error de Adapt, Bandera y NoDeEvaluaciones hechas:');
disp([error;flag;no_eval]);

%Grafica bonita
equis=[0:0.0001:1]';
plot(equis,f(equis)); hold on; area(equis,f(equis),'facecolor','y');
maxy=max(f(equis)); miny=min(f(equis));
axis([0,1,min(0,miny+0.5*miny),maxy+0.5*maxy]); grid on;
xlabel('x'); ylabel('y'); legend('f(x)','Integral');