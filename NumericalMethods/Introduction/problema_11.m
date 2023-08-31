n=input('n: ');
%La variable "dentro" es "m" en la descripción
dentro=0;
for i=[1:n]
    %Generamos el par (x_i,y_i)
    x=rand;
    y=rand;
    %Calculamos su distancia cuadrada con el origen
    dist=x^2+y^2;
    %Si es menor o igual a 1, (x_i,y_i) está en el cuarto de circulo
    if (dist<=1.0)
        dentro=dentro+1;
    end
end
%Calculamos el valor de la secuencia para este n particular
pi_n=4*dentro/n;
%Calcuamos los errores absoluto y relativo
error_abs=abs(pi_n-pi);
error_rel=error_abs/pi;
%Mostramos los resultados
format long;
disp(pi_n);
disp(error_abs);
disp(error_rel);