%Genera los vértices (x,y) de un poligono regular de n lados.
%
%Esta función genera un vector de puntos en el plano que son
%los vértices de un polígono regular de n lados centrado en (0,0).
%Se pide un vértice inicial (x_i,y_i) y el número de lados n.
function [x_pent,y_pent] = dibuja_poligono_regular(x_ini,y_ini,n)
    x_pent=zeros(n+1,1); x_pent(1)=x_ini; x_pent(n+1)=x_ini;
    y_pent=zeros(n+1,1); y_pent(1)=y_ini; y_pent(n+1)=y_ini;
    ang=2*pi/n;
    for i=[1:n-1]
        x_pent(i+1)=x_pent(i)*cos(ang)-y_pent(i)*sin(ang);
        y_pent(i+1)=x_pent(i)*sin(ang)+y_pent(i)*cos(ang);
    end
end

