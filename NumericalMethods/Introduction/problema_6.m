%Declarar vectores columna v1,v2,v3 y v4
v1=[0,1,0,1]';
v2=[1,2,3,4]';
v3=[1,0,1,0]';
v4=[0,0,1,1]';
%La matriz A está formada por los vectores en columnas
A=[v1,v2,v3,v4];
%Imprimimos su forma escalonada reducida por filas
escalonada_reducida=rref(A);
disp(escalonada_reducida);