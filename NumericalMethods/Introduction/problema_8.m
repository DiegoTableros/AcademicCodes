%Ingresamos el n que queremos
n=input('n: ');
%Calculamos las raices del polinomio generado
%estas raices deben ser 1,2,...,n
raices=roots(poly([1:n]));
%Mostramos todos los decimales con "format long" e imprimimos
format long;
disp(raices);