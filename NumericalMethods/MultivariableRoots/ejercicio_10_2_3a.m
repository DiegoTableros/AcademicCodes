    %Método de Newton multivariable
%PARTE SIMBOLICA
%Definir variables simbolicas para MATLAB (según se requiera)
syms sx1 sx2 sf1 sf2
%Definimos las funciones SIMBOLICAS sf1,sf2,...,sfn
sf1=3*sx1^2-sx2^2;
sf2=3*sx1*sx2^2-sx1^3-1;
%Definimos nuestra función simbolica vectorial
sF=[sf1;sf2];
%Jacobian(F,X) devuelve la matriz jacobiana simbolica
sJ=jacobian(sF,symvar(sF));

%ALGORITMO DE NEWTON
%Punto inicial (introducir valores en orden alfabetico simbolico)
x=[0.001,0.001];
disp('Aproximación inicial:'); disp(x);
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
    F=-double(subs(sF,symvar(sF),x));
    %Evaluamos el jacobiano J en el x actual, obteniendo J(x)
    J=double(subs(sJ,symvar(sJ),x));
    %Resolvemos el SistLin J(x) y = -F(x) para y
    y=mldivide(J,F);
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
disp('Iteraciones: '); disp(iteraciones);
disp('Resultado:'); disp(x);