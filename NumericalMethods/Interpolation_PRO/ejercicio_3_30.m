%Introducimos los 8 datos dados
c_0=[5,7.5,9.9,12.9,13.2,15.1,16.3,16.8];
D_cachucha=[0.024,0.0437,0.0797,0.1710,0.1990,0.326,0.846,0.972];
%Interpolamos y recuperamos las estructuras que contienen los coefs
%SELECCIONAR TIPO DE INTERPOLACIÓN
pp=spline(c_0,D_cachucha);
% pp=pchip(c_0,D_cachucha);

%METODO DESARROLLADO, HALLAR LAS DERIVADAS MANUALMENTE
%Calculamos los 7 primeros valores de D
D=zeros(1,8);
for i=1:7
    %Recuperamos los coeficientes a_i, b_i c_i y d_i
    a=pp.coefs(i,1); b=pp.coefs(i,2);
    c=pp.coefs(i,3); d=pp.coefs(i,4);
    %Computamos el valor de D
    D(i)=d+c*c_0(i);
end
%Computamos el caso especial en el ultimo punto
h=c_0(8)-c_0(7);
D(8)=a*(h^3+3*c_0(8)*h^2)+b*(h^2+2*c_0(8)*h)+c*(h+c_0(8))+d;
%Mostramos los resultados de los D para cada c_0
disp('(Método propio). Valores calculados de D para cada c_0:'); disp(D);

%METODO USANDO LA FUNCION fnder DE MATLAB
%Esta función recibe la estructura pp de la interpolación
%Devuelve otra estructura pp correspondiente a la derivada
D=ppval(pp,c_0)+c_0.*ppval(fnder(pp),c_0);
%Mostramos los resultados de los D para cada c_0
disp('(Método fnder). Valores calculados de D para cada c_0:'); disp(D);

%Gráfica auxiliar
x=5:0.01:16.8;
plot(x,ppval(pp,x),'linewidth',1); hold on;
xlabel('C_0'); ylabel('D_{cachucha}(C_0)'); grid on;
plot(c_0(1:8),D_cachucha(1:8),'k.','markersize',10);
legend('S(x)\approxD_{cachucha}(C_0)','Puntos interpolados');