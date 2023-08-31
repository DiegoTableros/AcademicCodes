f=@(x) 0.25.*atan(20.*(x-1));
a=-2.5; b=1.5;
tol=1e-6;
raiz=biseccion(f,a,b,tol);
disp('Raíz aproximada por bisección:');
disp(raiz);

%GRAFICADO
x=a:(b-a)/100:b;
y=f(a:(b-a)/100:b);
plot(x,y,'r-','linewidth',1); hold on;
plot(raiz,f(raiz),'k.','markersize',10); axis square; grid on;

function [r] = biseccion(f,a,b,tol)
    r=b;
    it=0;
    while abs(a-b)>tol && f(r)~=0
        %Calculamos una aproximación
        r=(b+a)/2;
        if sign(f(a))*sign(f(r))~=1
            b=r;
        else
            a=r;
        end
        it=it+1;
    end
    %disp('Iteraciones:'); disp(it);
    return;
end