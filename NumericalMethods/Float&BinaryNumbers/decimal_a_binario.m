bits_enteros=12;
bits_decimal=12;
b_e=zeros(1,bits_enteros+1);
b_d=zeros(1,bits_decimal+1);

numero=input('Numero decimal: ');
%Primero sacamos los bits de la parte entera
n=floor(numero);
pot=2^bits_enteros;
i=bits_enteros+1;
while(n~=0)
    if(n>=pot)
        n=n-pot;
        b_e(i)=1;
    end
    i=i-1;
    pot=pot/2;
end
n=numero-floor(numero);
pot=0.5;
i=1;
while(n~=0 && i<=bits_decimal)
    if(n>=pot)
        n=n-pot;
        b_d(i)=1;
    end
    i=i+1;
    pot=pot/2;
end
disp(b_e);
disp(b_d);