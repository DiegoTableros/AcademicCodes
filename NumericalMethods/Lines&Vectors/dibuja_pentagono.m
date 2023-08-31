%Genera los vértices (x,y) de un pentágono regular
%
%Esta función genera un vector de puntos en el plano
%que son los vértices de un pentágono regular
%Se pide un vértice inicial (x_i,y_i) 
function [x_pent,y_pent] = dibuja_pentagono(x_ini,y_ini)
    x_pent=zeros(6,1); x_pent(1)=x_ini; x_pent(6)=x_ini;
    y_pent=zeros(6,1); y_pent(1)=y_ini; y_pent(6)=y_ini;
    ang=2*pi/5;
    for i=[1:4]
        x_pent(i+1)=x_pent(i)*cos(ang)-y_pent(i)*sin(ang);
        y_pent(i+1)=x_pent(i)*sin(ang)+y_pent(i)*cos(ang);
    end
end

