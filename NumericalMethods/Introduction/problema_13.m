%Introducción del n y k
n=input('n: ');
k=input('k: ');
%Llamado de la función recursiva
respuesta=binomial(n,k);
disp(respuesta);
 
%Función que calcula el coeficiente binomial por recursión
function [res]=binomial(ene,ka)
    %Caso base k=0, n>=0
    if(ka==0 && ene>=0)
        res=1;
        return;
    end
    %Caso base n=0, k>0
    if(ene==0 && ka>0)
        res=0;
        return;
    end
    %Caso distinto se define por recursión
    res=0;
    res=res+binomial(ene-1,ka-1);
    res=res+binomial(ene-1,ka);
    return;
end