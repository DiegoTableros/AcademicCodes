%A es la matriz de hilbert 3x3
A=hilb(3);
%Factorizando LU a la matriz A
[L,U,P,condicion]=FACTOR(A);
%Encontremos la inversa columna a columna con la tecnica de resolver para
%distintos lados derechos
inversa=zeros(3,3);
for i=1:3
    lado_derecho=zeros(3,1); lado_derecho(i)=1;
    [inversa(:,i)]=SOLVE(L,U,P,lado_derecho);
end
%Mostramos la inversa obtenida
disp('Inversa de Hilb(3)'); disp(inversa);
%Mostramos el número de condicion provisto por FACTOR (Matlab) y el
%calculado con la inversa obtenida y la rutina de norma_maximo
disp('Números de condición para Hilb(3)');
disp(condicion); disp(norm(A,'Inf')*norm(inversa,'Inf'));

%Ahora A es la matriz de Hilbert con decimales truncados a 2 digitos
A=[1.00,0.50,0.33;0.50,0.33,0.25;0.33,0.25,0.20];
%A traves del proceso anterior obtenemos la inversa
[L,U,P,condicion]=FACTOR(A);
inversa=zeros(3,3);
for i=1:3
    lado_derecho=zeros(3,1); lado_derecho(i)=1;
    [inversa(:,i)]=SOLVE(L,U,P,lado_derecho);
end
%Esta vez calculamos el numero de condición con nuestra rutina
disp('Número de condición para Hilb(3) truncada')
disp(norm(A,'Inf')*norm(inversa,'Inf'));
%Calculamos el factor para la validez de la desigualdad
disp('Factor para validez de desigualdad');
disp(norm(inv(A),'Inf')*0.003333);
disp(inv(A));