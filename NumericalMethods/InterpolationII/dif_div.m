function [coef] = dif_div(x,y)
    %Se introducen en X y en Y los puntos (x_i,y_i) a interpolar
    x=[0;pi/2;pi]; y=[0;1;0]; n=length(x);
    %D es la matriz de las diferencias divididas
    D=zeros(n); D(:,1)=y;
    %Llamamos a la función desde la entrada (n,n) e imprimimos la diagonal
    dife_divi(n,n); coef=diag(D);
    
    %Función recursiva para construir las diferencias divididas
    function [res]=dife_divi(i,j)
        %Si es la primera columna, el caso es trivial f[x_i]=y(i)
        if j==1
            res=y(i);
            return;
        end
        %Sino, debe computarse a partir de los anteriores
        D(i,j)=dife_divi(i,j-1)-dife_divi(i-1,j-1);
        D(i,j)=D(i,j)/(x(i)-x(i-(j-1)));
        res=D(i,j);
        return;
    end
end

