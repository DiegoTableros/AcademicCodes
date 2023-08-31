%Función que calcula Pi por una serie
function [pi_aprox,err_abs]=problema_12(n_max)
    %Recibimos el termino limite de la suma por parametro en "n_max"
    %Inicializamos la suma finita en cero
    pi_aprox=0;
    %Iteramos desde 0 hasta n_max para sumar los terminos
    for n=[0:n_max]
        %Usamos la función power() para la potencia
        termino_1=power(16,n);
        %Calculamos la parte restante del termino
        termino_2=(4/(8*n+1)-2/(8*n+4)-1/(8*n+5)-1/(8*n+6));
        %Obtenemos el termino completo
        termino=termino_2/termino_1;
        %Sumamos la contribución a la suma parcial
        pi_aprox=pi_aprox+termino;
    end
    %Por ultimo calculamos el error relativo con el almacenado
    err_abs=abs(pi_aprox-pi);
    return;
end