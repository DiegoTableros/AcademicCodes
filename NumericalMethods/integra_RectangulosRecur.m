%FORMULA RECURSIVA DEL TRAPECIO 2^k INTERVALOS
f=@(x) sqrt(tan(x));
a=0; b=1.5;
k=input('k: ');
disp(rectan_recur(f,a,b,k));

function [res]=rectan_recur(f,a,b,k)
    if(k==0)
        res=((b-a)/2)*(f(a)+f(b));
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
    return;
end