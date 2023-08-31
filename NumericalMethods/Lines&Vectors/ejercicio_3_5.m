%Creamos el vector t
t=[-1:1];
%Pedimos n, el numero de segmentos a graficar
n=input('n: ');
%Hacemos variar j desde 0 hasta n
for j=[0:n]
    %Calculamos el theta para este j
    theta=2*j*pi/n;
    %Generamos los componentes del segmento
    lx=t*cos(theta); ly=t*sin(theta); lz=t*0.7;
    %Graficamos el segmento
    plot3(lx,ly,lz);
    %Propiedades de ejes
    hold on;
end
axis square;
xlabel('Eje X'); ylabel('Eje Y'); zlabel('Eje Z');