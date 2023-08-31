%Método de Newton multivariable
%PARTE SIMBOLICA
%Número de sumideros
N=20;
%Definir N variables simbolicas para MATLAB
sT=sym('st',[1,N]);
sF=sym('sf',[1,N]);
%Definimos las funciones SIMBOLICAS sf1,sf2,...,sf(N-1)
%en función de st1,st2,...,stn
for i=1:N-1
    sF(i)=(sin(sT(i+1)))/sqrt(12.868*(i+1))...
        -(sin(sT(i)))/sqrt(12.868*(i));
end
%Definimos la función SIMBOLICA sfN
sF(N)=-2;
for i=1:N
    sF(N)=sF(N)+0.2*tan(sT(i));
end
%Jacobian(F,X) devuelve la matriz jacobiana simbolica
sJ=jacobian(sF,sT);

%ALGORITMO DE NEWTON
%Punto inicial (se pide que sea [1,1,...,1])
x=ones(1,N);
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
    F=-double(subs(sF,sT,x));
    %Evaluamos el jacobiano J en el x actual, obteniendo J(x)
    J=double(subs(sJ,sT,x));
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
disp('Resultado:'); disp(x');