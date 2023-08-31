%Parámetros del tiro
masa=1; g=32; v_ini=50;
%Vector t requerido
t=0:0.01:5;
%Graficación de la trayectoria con mayor alcance horizontal
x=v_ini*cos(pi/4)*t;
y=v_ini*sin(pi/4)*t-0.5*g*t.^2;
plot(x,y,'k','Linewidth',3);
hold on; axis([0 80 0 40]); xlabel('x'); ylabel('y');
%Graficación de todas las trayectorias requeridas
for theta_grad=10:10:80
    theta=(theta_grad/180)*pi;
    x=v_ini*cos(theta)*t;
    y=v_ini*sin(theta)*t-0.5*g*t.^2;
    plot(x,y,'--');
    hold on;
end