%Definimos nuesta tolerancia absoluta y relativa
ABSERR=1e-8; RELERR=1e-6;
%Definimos nuestros valores de x=0,3,...,36
t=0:3:36; P=t;
%Definimos las constantes
k=0.001; M=1000; r=0.3; P0=250;
%Definimos la función del integrando
f=@(s) exp(k*M*(s-((6*r*sin(pi*s/6))/pi)));
%Calculamos las integrales iterativamente
for i=2:length(t)
    %Integramos en [x(i)-3,x(i)]
    a=t(i)-3; b=t(i);
    %Integramos con ADAPT
    [res,error,flag,no_eval]=Adapt(f,a,b,ABSERR,RELERR);
    %Guardamos y sumamos la integral anterior sobre [0,x(i)-3]
    P(i)=res+P(i-1);
end
%Finalmente multiplicamos cada resultado por su correspondiente constante
for i=1:length(t)
    P(i)=(P0*f(t(i)))/(1+k*P0*P(i));
end
%Mostramos los resultados
disp('Poblaciones calculadas para t=0,3,6,...,36'); disp(P');

%Grafica bonita
plot(t,P,'linewidth',1); hold on;
maxy=max(P); miny=min(P);
axis([0,36,min(0,miny+0.5*miny),maxy+0.5*maxy]); grid on;
xlabel('Tiempo [meses]'); ylabel('Población'); legend('P(t)');