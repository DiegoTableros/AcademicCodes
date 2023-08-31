%Introducimos los 21 datos reales
s_total=[1,5,10,15,20,21,22,22.5,22.6,22.7,22.8,...
    22.9,23,23.1,23.2,23.3,23.4,23.5,24,26,30];
E_total=[373,415,438,459,491,503,523,543,550,557,...
    565,575,590,620,860,915,944,958,986,1067,1125];
%Seleccionamos aleatoriamente 15 de ellos para interpolar
indices=randperm(21);
s=s_total(indices(1:15));
E=E_total(indices(1:15));
%Interpolamos usando spline y pchip
pp_spline=spline(s,E); pp_pchip=pchip(s,E);
%Graficamos en el intervalo [20,24]
x=20:0.01:24;
plot(x,ppval(pp_spline,x),'--','linewidth',2); hold on;
plot(x,ppval(pp_pchip,x),'-','linewidth',2); hold on;
plot(s_total(5:19),E_total(5:19),'ko','markersize',5);
%Propiedades de gráfica
xlabel('Added sol [ml]'); ylabel('E [Volts]'); axis square; grid on;
legend('S(x) con spline','S(x) con pchip', 'Datos experimentales');