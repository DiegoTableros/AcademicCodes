%Creamos el vector t de 0 a 2pi
t=0:2*pi/100:2*pi;
%Creamos los puntos de la elipse parametricamente
x_elip=2*cos(t);
y_elip=sin(t);
%Graficamos en la Figure 1 el elipse
figure(1);
plot(x_elip,y_elip,'LineWidth',2);
xlabel('x'); ylabel('y');
axis([-3,3,-2,2]);
hold on;

%Graficamos los vectores de velocidad en t=0,pi/2,pi,3pi/2
t_aux=[0,pi/2,pi,3*pi/2];
p_x=2*cos(t_aux); p_y=sin(t_aux);
v_x=-2*sin(t_aux); v_y=cos(t_aux);
quiver(p_x,p_y,v_x,v_y);

%Graficamos en la Figure 2 las graficas de la curvatura y la rapidez
figure(2);
curvatura=2./((sqrt(4.*sin(t).*sin(t)+cos(t).*cos(t))).^3);
subplot(1,2,1);
plot(t,curvatura,'y','LineWidth',3);
xlabel('\theta'); ylabel('Curvatura'); axis([0,2*pi,0,2.2]);

rapidez=sqrt(4.*sin(t).*sin(t)+cos(t).*cos(t));
subplot(1,2,2);
plot(t,rapidez,'r','LineWidth',3);
xlabel('\theta'); ylabel('Rapidez'); axis([0,2*pi,0,2.2]);

%Calculamos la longitud de arco del elipse
format long;
%Método de poligonalización a 100 segmentos
long_segmentos=0;
for i=1:100
    dx=x_elip(i+1)-x_elip(i);
    dy=y_elip(i+1)-y_elip(i);
    dr=[dx,dy];
    long_segmentos=long_segmentos+norm(dr);
end
disp('Longitud del elipse por segmentos: ');
disp(long_segmentos);
%Método de integración numérica de la longitud de arco
integrando=@(o) sqrt(4.*sin(o).*sin(o)+cos(o).*cos(o));
long_integral=integral(integrando,0,2*pi);
disp('Longitud del elipse por integral númerica: ');
disp(long_integral);