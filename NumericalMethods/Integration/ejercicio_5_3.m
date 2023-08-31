%Integral de 0 a pi de 1/(4+sin(20x))
f=@(x) (1./(4+sin(20*x)));
%Dividimos el intervalo [0,pi] en n piezas igualmente espaciadas
n=input('Número de puntos n: ');
a=0; b=pi; h=(b-a)/n;
x=0:h:pi;
%La integral es la suma de la regla del trapecio en cada intervalo
integral=0;
for i=1:n
    %Sacamos el area del trapecio en [x_i,x_i+1] con (B+b)*h/2
    trapecio=(f(x(i))+f(x(i+1)))*h/2;
    integral=integral+trapecio;
end
%Imprimimos la aproximación a la integral
disp('Integral por trapecio compuesto de 1/(4+sin(20x)) en [0,pi]');
disp('n:'); disp(n);
disp ('Aproximación:'); disp(integral);
%Sacamos el error entre la integral real y nuestra aproximación
disp('Error absoluto: '); disp(abs((pi/sqrt(15))-integral));

%Grafica bonita y opcional para ver la regla del trapecio
equis=0:pi/1000:pi;
plot(equis,f(equis)); hold on;
plot(x,f(x)); axis([0,pi,0,0.5]);
area(equis,f(equis)); area(x,f(x),'facealpha',0.3);
legend('f(x)','Aprox. trapecios','Integral f(x)','Aprox. regla trapecio');
xlabel('x'); ylabel('y'); grid on;