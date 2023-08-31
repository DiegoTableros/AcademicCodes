function [yq] = newton_interp(x,y,xq)
    n=length(x);
    D=zeros(n); D(:,1)=y';
    dife_divi(n,n); coef=diag(D);
    
    yq=zeros(1,length(xq));
    for k=1:length(xq)
        monom=1;
        suma=0;
        for i=1:n
            suma=suma+coef(i)*monom;
            monom=monom*(xq(k)-x(i));
        end
        yq(k)=suma;
    end
    return;
    
    %Función recursiva para construir las diferencias divididas
    function [res]=dife_divi(i,j)
        if j==1
            res=y(i);
            return;
        end
        D(i,j)=dife_divi(i,j-1)-dife_divi(i-1,j-1);
        D(i,j)=D(i,j)/(x(i)-x(i-(j-1)));
        res=D(i,j);
        return;
    end
end

