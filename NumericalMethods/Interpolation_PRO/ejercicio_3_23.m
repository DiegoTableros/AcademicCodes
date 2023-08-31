%Introducimos los datos de la longitud de onda y absorcion
l=[3125,3250:250:5000];
A=[0.7,0.572,0.382,0.56,0.836,0.53,0.17,0.183,0.35];
%Introducimos los datos restantes que no fueron interpolados
l_r=[3375:250:4875];
A_r=[0.4,0.449,0.769,0.75,0.315,0.144,0.252];
%ACTIVAR EL CAMBIO DE VARIABLE INDEPENDIENTE DESEADO a), b) o c)
% l=l; l_r=l_r;
% l=l./1000; l_r=l_r./1000;
% l=(l-4000)./1000; l_r=(l_r-4000)/1000;

%Interpolamos utilizando pchip y spline
pp_pchip=pchip(l,A);
pp_spline=spline(l,A);
%Graficamos la función interpolante en el intervalo correspondiente
x=l(1):(l(9)-l(1))/1000:l(9);
plot(x,ppval(pp_pchip,x),'--'); hold on;
plot(x,ppval(pp_spline,x),'k-'); hold on;
axis([3125,5000,0,1]);
xlabel('Longitud de onda (\lambda)'); ylabel('Absorción de la luz (A)');
%Graficamos puntos no interpolados
plot(l(1:1:7),A(1:1:7),'r.','markersize',15);
plot(l_r(1:1:7),A_r(1:1:7),'mo','markersize',5);
legend('S(x) con pchip','S(x) con spline',...
    'Puntos interpolados','Puntos no interpolados');
%Calculamos los errores de los no interpolados con su interpolación
err_spline=abs(A_r-ppval(pp_spline,l_r));
err_pchip=abs(A_r-ppval(pp_pchip,l_r));
disp('Cambio de variable independiente x=(lambda-4000)/1000');
disp('Errores absolutos entre puntos no interpolados y S(x) spline:');
disp(err_spline);
disp('Errores absolutos entre puntos no interpolados y S(x) pchip:');
disp(err_pchip);