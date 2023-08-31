%La normal de los planos es un vector que forme un angulo
%de pi/6 con el plano YZ, se eligió el vector unitario
%en el plano ZX dado por (cos(pi/6),0,sin(pi/6))
normal=[cos(pi/6),0,sin(pi/6)];
%Un for para graficar los 8 planos
for i=1:8
    %Sacamos la coordenada en X del punto inicial dentro del plano
    %Recordemos que el primer plano está en el origen (0,0,0) y para
    %que estén separados perpendicularmente por 1 unidad deben estar
    %separados una distancia de 1/cos(pi/6) en el eje X
    coord_x=(i-1)/cos(pi/6);
    %Usamos la función Plane que propone el autor
    plane([coord_x,0,0],normal,1,1);
    hold on;
end
%Graficamos auxiliarmente los ejes coordenados
plot3([0,9],[0,0],[0,0],'b','LineWidth',3);
plot3([0,0],[-1,1],[0,0],'b','LineWidth',3);
plot3([0,0],[0,0],[-1,1],'b','LineWidth',3);
xlabel('x'); ylabel('y'); zlabel('z');