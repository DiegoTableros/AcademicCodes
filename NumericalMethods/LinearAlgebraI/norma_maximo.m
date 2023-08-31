function [norma_max] = norma_maximo(A)
%Calculamos la norma del maximo para A
    norma_max=0;
    for i=1:height(A)
        acum=0;
        for j=1:width(A)
            acum=acum+abs(A(i,j));
        end
        if acum>norma_max
            norma_max=acum;
        end
    end
end