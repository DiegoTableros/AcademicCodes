%Definimos nuesta tolerancia absoluta y relativa
ABSERR=1e-12; RELERR=1e-6;
%Intervalo de integración [a,b]
a=1/4; b=1;
%Definimos la función (DESCOMENTAR PARA ELEGIR)
% f=@(x) 4./(1+x.^2);
% f=@(x) x.^(1/10);
% f=@(x) 1./((3.*x-2).^2);
% f=@(x) 1+(sin(38*pi.*x)).^2;
% f=@(x) ppval(mkpp([0,0.1,0.6,1],[0,2,-1]),x);
f=@(x) 1./sqrt(x-0.25);

%Integramos con INTEGRAL
disp('Integral provista por Integral:');
disp(integral(f,a,b,'AbsTol',ABSERR,'RelTol',RELERR));

%Integramos con QUADGK
[res,error]=quadgk(f,a,b,'AbsTol',ABSERR,'RelTol',RELERR);
disp('Integral provista por Quadgk y su cota de error:');
disp([res;error]);

%Integramos con ADAPT
[res,error,flag,no_eval]=Adapt(f,a,b,ABSERR,RELERR);
disp('Integral provista por Adapt:');
disp(res);
disp('Error de Adapt, Bandera y NoDeEvaluaciones hechas:');
disp([error;flag;no_eval]);

%Grafica bonita
equis=[0:0.0001:1]';
plot(equis,f(equis)); hold on; area(equis,f(equis),'facecolor','k');
maxy=max(f(equis)); miny=min(f(equis));
axis([0,1,min(0,miny+0.5*miny),maxy+0.5*maxy]); grid on;
xlabel('x'); ylabel('y'); legend('f(x)','Integral');