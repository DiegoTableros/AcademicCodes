%Instroducimos los valores de temperatura y presión
temp=[0:10:100]';
pres=[0.006107,0.012277,0.023378,0.042433,0.073774,0.12338,...
    0.19924,0.31166,0.47364,0.70112,1.01325]';
%Interpolamos con splines cúbicos utilizando "spline" y "pchip"
%Estas funciones regresan una estructura con los polinomios a trozos
pp_spline=spline(temp,pres);
pp_pchip=pchip(temp,pres);
%Graficamos la interpolación de los datos en [0,100]
%Las estructuras anteriores se evaluan con "ppval"
x=[0:0.5:100];
plot(x,ppval(pp_spline,x),'y-','linewidth',1.5); hold on;
plot(x,ppval(pp_pchip,x),'r--','linewidth',1.5); hold on;
legend('S(x) con spline','S(x) con pchip'); axis square;
xlabel('Temperatura [°C]'); ylabel('Presión de vapor del agua [bars]');
%Por último insertamos y graficamos los puntos pedidos
x=[5,45,95]; y=[0.008721,0.095848,0.84528];
plot(x(1),y(1),'k.','MarkerSize',14,'handlevisibility','off');
plot(x(2),y(2),'k.','MarkerSize',14,'handlevisibility','off');
plot(x(3),y(3),'k.','MarkerSize',14,'handlevisibility','off');
y_spline=ppval(pp_spline,x); y_spline=abs(y_spline-y);
disp('Errores absolutos de P(5), P(45), P(95) por Spline');
disp(y_spline);
y_pchip=ppval(pp_pchip,x); y_pchip=abs(y_pchip-y);
disp('Errores absolutos de P(5), P(45), P(95) por Pchip');
disp(y_pchip);