function [L,U,P,ncondi,inv_ncondi] = FACTOR(A)
    %Hacemos eliminación para A y obtenemos L,U
    %P se puede obtener como matriz o como vector (descomentar)
    [L,U,P]=lu(A);
    %%%[L,U,P]=lu(A,'vector');
    
    %Calculamos el numero de condición de la matriz (norma personalizable)
    ncondi=cond(A,'Inf');
    %Calculamos el inverso de la condición de la matriz (norma 1)
    inv_ncondi=rcond(A);
    return;
end