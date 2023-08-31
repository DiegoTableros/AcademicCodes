%Introducimos los 19 datos reales
s_total=[4.6,4.8,5:0.1:6,6.5,7,7.5,8,9,10];
E_total=[32.11,9,-3.52,-7.11,-9.22,-10.74,-11.57,-11.95,-12,...
    -11.73,-11.23,-10.71,-10.13,-7.15,-4.77,-3.17,-2.14,-1.03,-0.54];
%Seleccionamos aleatoriamente 12 de ellos para interpolar
indices=randperm(19);
s=[4.6,4.8,5,5.1,5.2,5.3,6.5,7,7.5,8,9,10]; % s=s_total(indices(1:12));
E=[32.11,9,-3.52,-7.11,-9.22,-10.74,-7.15,-4.77,-3.17,-2.14,-1.03,-0.54]; %E=E_total(indices(1:12));
%Interpolamos usando spline y pchip
pp_spline=spline(s,E); pp_pchip=pchip(s,E);
%Graficamos en el intervalo [4.6,10]
x=4.6:0.005:10;
plot(x,ppval(pp_spline,x),'--','linewidth',2); hold on;
plot(x,ppval(pp_pchip,x),'-','linewidth',2); hold on;
plot(s_total(1:19),E_total(1:19),'ko','markersize',5);
%Propiedades de gráfica
xlabel('Distancia internuclear r [Bohrs]');
ylabel('Energía potencial V(r)'); axis square; grid on;
legend('S(x) con spline','S(x) con pchip', 'Datos experimentales');