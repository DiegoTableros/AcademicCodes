%Método de Newton multivariable
%PARTE SIMBOLICA
%Definir variables simbolicas para MATLAB (según se requiera)
syms sx1 sx2 sf1 sf2
%Definimos las funciones SIMBOLICAS sf1,sf2,...,sfn
sf1=4*sx1^2-20*sx1+(sx2^2)/4+8;
sf2=(sx1*sx2^2)/2+2*sx1-5*sx2+8;
%Definimos nuestra función simbolica vectorial
sF=[sf1;sf2];
%Jacobian(F,X) devuelve la matriz jacobiana simbolica
sJ=jacobian(sF,symvar(sF));

%ALGORITMO DE NEWTON
%Punto inicial (introducir valores en orden alfabetico simbolico)
x=[0,0];
%Tolerancia
tol=input('Tolerancia:');
%Variables de iteración
max_iteraciones=input('Máximo num de iteraciones:');
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

% ENTRADA:    n ecuaciones e incógnitas
%             aproximación inicial x0
%             tolerancia
%             número máximo de iteraciones
% SALIDA:     solución aproximada x
%             o bien, mensaje de error
% 
% 1) Inicialmente no hemos hecho iteraciones, k=0 y xk=x0
% 2) Mientras no se exceda el máximo de iteraciones, k<=MaxItera
%     3) Calcular el valor de F(xk)
%     4) Calcular el valor de J(xk) con J matriz jacobiana del sistema
%     5) Resolver el sistema lineal J(xk) y=-F(xk) para y
%     6) Hacer xk=xk+y
%     7) Si norm(y,'inf')<tolerancia
%         8) break, finalización correcta
%     9) Hacer k=k+1, hemos iterado una vez más
% 10) Mostrar el último resultado, nuestra mejor aproximación
% 11) Mostrar si se excedieron las iteraciones o se llegó al resultado