%Definimos nuesta tolerancia absoluta y relativa
ABSERR=1e-8; RELERR=1e-6;

%INTEGRAL NORMAL
%Definimos los elementos para integrar
a=0; b=1; f=@(x) sin(x)./sqrt(x);
[res,errest,flag,no_eval]=Adapt(f,a,b,ABSERR,RELERR);
disp('Integral normal y error estimado'); disp([res;errest]);
equis=a:(b-a)/1000:b;
plot(equis,f(equis),'linewidth',1); hold on;

%INTEGRAL CON EL DESARROLLO EN SERIES
a=0; b=1; f=@(x) sqrt(x);
[res,errest,flag,no_eval]=Adapt(f,a,b,ABSERR,RELERR);
disp('Integral por series y error estimado'); disp([res;errest]);
equis=a:(b-a)/1000:b;
plot(equis,f(equis),'linewidth',1); hold on;




%Grafica bonita
maxy=max(f(equis)); miny=min(f(equis));
axis([a,b,min(0,miny+0.5*miny),maxy+0.5*maxy]); grid on;
xlabel('x'); ylabel('y'); legend('f(t)');