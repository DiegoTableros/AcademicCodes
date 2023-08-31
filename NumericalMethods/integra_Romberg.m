%FORMULA RECURSIVA DEL TRAPECIO 2^k INTERVALOS
global tablaRom
f=@(x) sqrt(tan(x));
a=0; b=1.5; k=10;
tablaRom=zeros(k+1);
rectan_recur(f,a,b,k);
completa_Romb(k+1,k+1);
disp(tablaRom);

function [res]=completa_Romb(i,j)
    global tablaRom
    if(j==1)
        res=tablaRom(i,j);
        return;
    end
    res=completa_Romb(i,j-1);
    res=res+((1/(4^j-1))*(res-completa_Romb(i-1,j-1)));
    tablaRom(i,j)=res;
    return;
end

function [res]=rectan_recur(f,a,b,k)
    global tablaRom
    if(k==0)
        res=((b-a)/2)*(f(a)+f(b));
        tablaRom(k+1,1)=res;
        return;
    end
    hk=(b-a)/(2^k);
    res=(rectan_recur(f,a,b,k-1))/2;
    sum=0;
    for k=1:2^(k-1)
        sum=sum+f(a+(2*k-1)*hk);
    end
    sum=hk*sum;
    res=res+sum;
    tablaRom(k+1,1)=res;
    return;
end