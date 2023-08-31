%Guardamos A y B del sistema AX=B
A=[0.172,0.013,0.144; 0.368,0.681,0.271; 0.099,0.510,0.329];
B=[1.44,4.35,1.32,3.95; 2.84,9.30,2.90,8.29; 2.36,3.45,3.25,7.35];
%Para determinar X debemos reducir AX=B a sistemas de la forma Ax=b con
%x y b vectores columna de X y B respectivamente
%Factorizamos LU a A inicialmente
[L,U,P,condicion]=FACTOR(A);
%Inicializamos la matriz resultado X como una 3x4
X=zeros(3,4);
%Generamos las columnas de X una a una
for i=1:4
    %Resolvemos Ax=b con x y b las i-esimas columnas de X y B
    [X(:,i)]=SOLVE(L,U,P,B(:,i));
end
%Mostramos la solución obtenida X
disp('X:'); disp(X);

%Obtención de la inversa de A (matriz 3x3) columna a columna
inversa=zeros(3,3);
for i=1:3
    lado_derecho=zeros(3,1); lado_derecho(i)=1;
    [inversa(:,i)]=SOLVE(L,U,P,lado_derecho);
end
disp('Inv(A):'); disp(inversa);
%Mostramos los numeros de condición provistos por FACTOR y calculados
disp('Número de condición provisto por Matlab:'); disp(condicion);
disp('Número de condición calculado: ');
disp(norm(A,'Inf')*norm(inversa,'Inf'));

%Guardamos X(2,1) antes del cambio
x_2_1_antes=X(2,1);
%Cambiamos la entrada B(1,1) de 1.44 a 1.43
B(1,1)=1.43;
%Resolvemos una vez más
X=zeros(3,4);
for i=1:4
    [X(:,i)]=SOLVE(L,U,P,B(:,i));
end
%Guardamos X(2,1) despues del cambio
x_2_1_despues=X(2,1);
%Mostramos X recalculada tras la perturbación
disp('X calculado tras la perturbación en B(1,1):'); disp(X);
%Mostramos la diferencia entre X(2,1) antes y despues de perturbar
disp('|X(2,1)_antes - X(2,1)_despues|:');
disp(abs(x_2_1_antes-x_2_1_despues));