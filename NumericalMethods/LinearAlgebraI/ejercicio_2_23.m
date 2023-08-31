%Declaramos las matrices a computar
A_13=[1,2,3;4,5,6;7,8,9.01];
A_15=[11,-5,0,0,0,-1;-20,41,-15,0,-6,0;0,-3,7,-4,0,0;
    0,0,-1,2,-1,0;0,-3,0,-10,28,-15;-2,0,0,0,-15,47];
%Se ha hecho la modificación adecuada en la función FACTOR

%Obteniendo el determinante de A_13
[L,U,P]=FACTOR(A_13);
prod_pivotes=prod(diag(U));
%Recuperar el número de intercambios a partir de la info que da P
no_intercambios=0;
for i=1:length(A_13)
    %Mientras i no esté en su posición adecuada
    while P(i)~=i
        %Intercambia las posiciones que guarda
        aux=P(i); P(i)=P(aux); P(aux)=aux;
        no_intercambios=no_intercambios+1;
    end
end
determinante=prod_pivotes*((-1)^no_intercambios);
disp('Determinante de A_13 calculado por este método y por Matlab:');
disp(determinante); disp(det(A_13));

%Obteniendo el determinante de A_13
[L,U,P]=FACTOR(A_15);
prod_pivotes=prod(diag(U));
%Recuperar el número de intercambios a partir de la info que da P
no_intercambios=0;
for i=1:length(A_15)
    %Mientras i no esté en su posición adecuada
    while P(i)~=i
        %Intercambia las posiciones que guarda
        aux=P(i); P(i)=P(aux); P(aux)=aux;
        no_intercambios=no_intercambios+1;
    end
end
determinante=prod_pivotes*((-1)^no_intercambios);
disp('Determinante de A_15 calculado por este método y por Matlab:');
disp(determinante); disp(det(A_15));