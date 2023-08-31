%Declaramos la matriz
A=[1,2,3;4,5,6;7,8,9.01];
%Calculamos la factorización LU para A usando FACTOR
[L,U,P,condicion]=FACTOR(A);
%Calculemos su inversa obteniendo columna a columna
%Como solo va cambiando el lado derecho, solo usamos SOLVE
%Inicializamos la inversa como una matriz 3x3
inversa=zeros(3,3);
for i=1:3
    %El lado derecho es un vector cuya i-esima entrada nos dara dicha
    %columna de la matriz inversa
    lado_derecho=zeros(3,1);
    lado_derecho(i)=1;
    %Obtenemos la columna
    [inversa(:,i)]=SOLVE(L,U,P,lado_derecho);
    %Añadimos la columna a la inversa
end
%Mostramos la inversa obtenida y su multiplicación
disp('Inv(A)='); disp(inversa);
%Mostramos la multiplicación A*inversa
disp('A*Inv(A)='); disp(A*inversa);