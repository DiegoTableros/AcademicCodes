%%%%%Opcional: Graficar círculos de radio 1 y 0.4
t=[0:2*pi/100:2*pi];
circ_1x=cos(t); circ_1y=sin(t);
plot(circ_1x,circ_1y);
%circ_4x=0.4*cos(t); circ_4y=0.4*sin(t);
% plot(circ_4x,circ_4y);

%Propiedades y limites de los ejes
axis square;
axis([-1.2,1.2,-1.2,1.2]);
xlabel('Eje X'); ylabel('Eje Y');
hold on;

%Generamos los puntos de los dos pentagonos
[x_g,y_g]=dibuja_pentagono(0,1);
[x_p,y_p]=dibuja_pentagono(0,-0.4);
plot(x_g,y_g,'LineWidth',3);
%plot(x_p,y_p,'LineWidth',2);

%Generamos los puntos de la estrella
x_estrella=zeros(11,1); x_estrella(11)=x_g(1);
y_estrella=zeros(11,1); y_estrella(11)=y_g(1);
pos_g=1; pos_p=4;
for i=[1:10]
    if(mod(i,2)==1)
        x_estrella(i)=x_g(pos_g);
        y_estrella(i)=y_g(pos_g);
        pos_g=pos_g+1;
    else
        x_estrella(i)=x_p(pos_p);
        y_estrella(i)=y_p(pos_p);
        pos_p=pos_p+1;
        if(pos_p==6)
            pos_p=1;
        end
    end
end
%Graficamos los puntos de la estrella
%plot(x_estrella,y_estrella,'Linewidth',3);