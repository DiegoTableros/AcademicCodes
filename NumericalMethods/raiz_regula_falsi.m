f=@(x) 0.25.*atan(20.*(x-1));
a=-2.5; b=1.5;
tol=1e-6;
raiz=regula_falsi(f,a,b,tol);
disp('Raíz aproximada por regula falsi:');
disp(raiz);

%GRAFICADO
x=a:(b-a)/100:b;
y=f(a:(b-a)/100:b);
plot(x,y,'r-','linewidth',1); hold on;
plot(raiz,f(raiz),'k.','markersize',10); axis square; grid on;

function [c] = regula_falsi(f,a,b,tol)
    c=b;
    it=0;
    while abs(b-a)>tol && f(c)~=0
        %Calculamos c del punto (c,0)
        c=b-(f(b)*((b-a)/(f(b)-f(a))));
        if f(c)*f(a)<0
            b=c;
        else
            a=c;
        end
        it=it+1;
    end
    %disp('Iteraciones:'); disp(it);
    return;
end