%Método de Newton multivariable

%PARTE SIMBOLICA
%Construcción de los valores expermentales como simbolicos
N=4;
sY=sym('sy',[1,N]);
sX=sym('sx',[1,N]);
sY=subs(sY,symvar(sY),[2.4,3.8,4.75,21.6]);
sX=subs(sX,symvar(sX),[31.8,31.5,31.2,30.2]);
%Construcción de las funciones simbólicas
syms a b c aux1 aux2
sF=sym('sf',[1,3]);
%Generamos la primer función
aux1=0; aux2=0;
for i=1:N
    aux1=aux1+((sY(i)*log(sY(i)))/((sX(i)-b)^c));
end
for i=1:N
    aux2=aux2+(1/((sX(i)-b)^(2*c)));
end
sF(1)=aux1/aux2;
%Generamos la segunda función
aux1=0; aux2=0;
for i=1:N
    aux1=aux1+((sY(i)*log(sY(i)))/((sX(i)-b)^c));
end
for i=1:N
    aux2=aux2+(1/((sX(i)-b)^(2*c+1)));
end
sF(2)=aux1*aux2;
aux1=0; aux2=0;
for i=1:N
    aux1=aux1+((sY(i)*log(sY(i)))/((sX(i)-b)^(c+1)));
end
for i=1:N
    aux2=aux2+(1/((sX(i)-b)^(2*c)));
end
sF(2)=sF(2)-(aux1*aux2);
%Generamos la tercer función
aux1=0; aux2=0;
for i=1:N
    aux1=aux1+((sY(i)*log(sY(i)))/((sX(i)-b)^c));
end
for i=1:N
    aux2=aux2+((log(sX(i)-b))/((sX(i)-b)^(2*c)));
end
sF(3)=aux1*aux2;
aux1=0; aux2=0;
for i=1:N
    aux1=aux1+((sY(i)*log(sY(i))*log(sX(i)-b))/((sX(i)-b)^c));
end
for i=1:N
    aux2=aux2+(1/((sX(i)-b)^(2*c)));
end
sF(3)=sF(3)-(aux1*aux2);
%Jacobian(F,X) devuelve la matriz jacobiana simbolica
sJ=jacobian([sF(2),sF(3)],[b,c]);

%ALGORITMO DE NEWTON
%Punto inicial
x=[26.8,8.3];
%Tolerancia
tol=input('Tolerancia: ');
%Variables de iteración
max_iteraciones=input('Máximo num de iteraciones: ');
iteraciones=0;

%Algoritmo
while iteraciones<max_iteraciones
    %Aumentamos número de iteraciones
    iteraciones=iteraciones+1;
    %Evaluamos la función -F en el x actual, obteniendo -F(x)
    F=-double(subs([sF(2),sF(3)],[b,c],x));
    %Evaluamos el jacobiano J en el x actual, obteniendo J(x)
    J=double(subs(sJ,[b,c],x));
    %Resolvemos el SistLin J(x) y = -F(x) para y
    y=mldivide(J,F');
    %Hacemos x=x+y, es decir, actualizamos nuestra aprox
    x=x+y';
    %Vemos si hemos cumplido la tolerancia de error
    if (norm(y,'inf')<=tol)
        %Terminamos, imprimimos resultado y salimos
        break;
    end
    %Sino, seguimos calculado
end
%Mensajes de resultado
if(iteraciones>=max_iteraciones)
    disp('Número máximo de iteraciones alcanzado');
end
disp('Iteraciones:'); disp(iteraciones);
%Mostramos los resultados obtenidos para b y c
disp('Resultado [b,c]:'); disp(x');
%Sustituimos b,c en la expresión de a y mostramos el cálculo
disp('Resultado [a]:'); disp(double(subs(sF(1),[b,c],x)));