%Método de Newton multivariable
%PARTE SIMBOLICA
%Definir variables simbolicas para MATLAB (según se requiera)
syms sx1 sx2 sx3 sf1 sf2 sf3
%Definimos las funciones SIMBOLICAS sf1,sf2,...,sfn
sf1=3*sx1-cos(sx2*sx3)-1/2;
sf2=4*sx1^2-625*sx2^2+2*sx2-1;
sf3=exp(-sx1*sx2)+20*sx3+((10*pi-3)/3);
%Definimos nuestra función simbolica vectorial
sF=[sf1;sf2;sf3];
%Jacobian(F,X) devuelve la matriz jacobiana simbolica
sJ=jacobian(sF,symvar(sF));

%ALGORITMO DE NEWTON
%Punto inicial (introducir valores en orden alfabetico simbolico)
x=[0,0,0];
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
    disp(iteraciones);
end
disp('Resultado:'); disp(x);