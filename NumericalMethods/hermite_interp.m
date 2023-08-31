function [yq] = hermite_interp(xx,yy,deri,xq)
    %Hacemos concatenación de xx,yy para el proceso de dif. divid.
    x=[xx;xx]; y=[yy;yy];
    %Numero de elementos de las matrices concatenadas x,y
    n=width(x)*height(x);
    %Matrices para las diferencias divididas
    D=zeros(n); visit=zeros(n);
    %Ponemos las diferencias divididas inicialmente como derivadas
    for i=1:length(deri)
        D(2*i,2)=deri(i); visit(2*i,2)=1;
    end
    %Ejecutamos la función recursiva y obtenemos las dif. div. diagonales
    dife_divi(n,n); coef=diag(D); disp(D);
    %Ahora obtenemos los puntos interpolados yq dados los xq
    yq=zeros(length(xq),1);
    for k=1:length(xq)
        %El pol.interp. de Hermite es la sumatoria ...
        for i=1:n
            %Cada termino de la suma es una dif. div. ...
            sum=coef(i);
            %multiplicada por i-1 factores adicionales
            for j=1:i-1
                sum=sum*(xq(k)-x(j));
            end
            %Guardamos el correspondiente punto ya interpolado en yq(k)
            yq(k)=yq(k)+sum;
        end
    end
    %Terminamos, retornamos yq, hemos obtenido (xq,yq) interpolados
    return;
    
    %FUNCIÓN RECURSIVA PARA OBTENER LAS DIFERENCIAS DIVIDIDAS HERMITE
    function [res]=dife_divi(i,j)
        %Si es la primera columna, el caso es trivial f[x_i]=y(i)
        if j==1
            res=y(i); D(i,j)=res; visit(i,j)=1;
            return;
        end
        %Si ya está visitado, solo retornamos el valor guardado
        if visit(i,j)==1
            res=D(i,j);
            return;
        end
        %Sino, debe computarse a partir de los anteriores y visitarse
        D(i,j)=dife_divi(i,j-1)-dife_divi(i-1,j-1);
        D(i,j)=D(i,j)/(x(i)-x(i-(j-1)));
        res=D(i,j); visit(i,j)=1;
        return;
    end
end

