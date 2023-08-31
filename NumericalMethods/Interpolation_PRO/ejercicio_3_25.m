%Introducimos valores para interpolar
f=[20,40,100,400,1250,4000,16000,40000,80000];
A=[0.008,0.03,0.151,0.592,1.477,9.618,122.278,429.31,850.536];
f_log=log(f); A_log=log(A);
%Introducimos adicionalmente los puntos no interpolados
f_r=[63,200,800,2000,10000]; A_r=[0.07,0.359,0.935,2.87,53.478];
f_r_log=log(f_r); A_r_log=log(A_r);
%Interpolamos cada serie de datos usando spline ó pchip (OPCIONAL)
% pp_1=spline(f,A); pp_pchip_1=pchip(f,A);
% pp_2=spline(f_log,A_log); pp_pchip_2=pchip(f_log,A_log);
pp_1=pchip(f,A); pp_pchip_1=pchip(f,A);
pp_2=pchip(f_log,A_log); pp_pchip_2=pchip(f_log,A_log);

%Graficamos los resultados normales
subplot(1,2,1);
x=f(1):(f(9)-f(1))/1000:f(9);
y=ppval(pp_1,x);
plot(x,y,'linewidth',1); hold on;
plot(f(1:9),A(1:9),'b.','markersize',12);
plot(f_r(1:5),A_r(1:5),'ro','markersize',4);
legend('S(x) con spline','Puntos interpolados','Puntos no interpolados');
xlabel('f'); ylabel('A(f)');

%Graficamos los resultados en escala logaritmica
subplot(1,2,2);
x=f_log(1):(f_log(9)-f_log(1))/1000:f_log(9);
y=ppval(pp_2,x);
plot(x,y,'linewidth',1); hold on;
plot(f_log(1:9),A_log(1:9),'b.','markersize',10);
plot(f_r_log(1:5),A_r_log(1:5),'ro','markersize',4);
legend('S(x) con spline','Puntos interpolados','Puntos no interpolados');
xlabel('log f'); ylabel('log A(f)');

%Calculamos el error de interpolación en los puntos no interpolados
error_acum_normal=sum(abs(A_r-ppval(pp_1,f_r)));
error_acum_log=sum(abs(A_r_log-ppval(pp_2,f_r_log)));
disp('Errores absolutos acumulados para escala normal y logaritmica:');
disp(error_acum_normal); disp(error_acum_log);