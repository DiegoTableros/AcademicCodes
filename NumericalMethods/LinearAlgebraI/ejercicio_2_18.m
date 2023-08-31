clc;
%Declaramos A y b del sistema dado Ax=b
A=[0.217,0.732,0.414; 0.508,0.809,0.376; 0.795,0.886,0.338];
b=[0.741;0.613;0.485];
%Resolvemos el sistema para x
[L,U,P,cond_A]=FACTOR(A);
[x]=SOLVE(L,U,P,b);
%Mostramos el resultado x
disp('x:'); disp(x);
%Mostramos cond(A)
disp('cond(A):'); disp(cond(A));
disp('||A||:'); disp(norm(A,'Inf'));
disp('||b||:'); disp(norm(b,'Inf'));
%Mostramos el factor de validez de la desigualdad
factor_val_desigualdad_1=norm(inv(A),'Inf')*0.0015;
disp('Factor ||inv(A)||*||Delta A||:'); disp(factor_val_desigualdad_1);

%Generamos y mostramos incrementos ALEATORIOS de +-0.0005 para A y b
deltaA=0.0005.*(2*randi([0,1],3,3)-1); disp('DeltaA:'); disp(deltaA);
deltab=0.0005.*(2*randi([0,1],3,1)-1); disp('DeltaB:'); disp(deltab);
%Resolvemos ahora (A+deltaA)(x+deltax)=(b+deltab) para x+deltax
[L,U,P,cond_deltaA]=FACTOR(A+deltaA);
[xmasdeltax]=SOLVE(L,U,P,b+deltab);
%Mostramos el resultado (x+deltax) del sistema perturbado
disp('x+Delta x:'); disp(xmasdeltax);
%Error relativo de la solución perturbada con la original
disp('||Delta x||/||x||:'); disp(norm(xmasdeltax-x,'Inf')/norm(x,'Inf'));
%Error relativo de cada entrada de x+Delta x con respecto a x
errores_rel_fila=zeros(3,1);
for i=1:3
    errores_rel_fila(i)=(xmasdeltax(i)-x(i))/x(i);
end
disp('Errores relativos por filas:'); disp(errores_rel_fila);

%Opcional: factor ||A^-1*DeltaA|| para validez de desigualdad
factor_val_desigualdad_2=norm(inv(A)*deltaA,'Inf');
disp('Factor ||inv(A)*Delta A||:'); disp(factor_val_desigualdad_2);
if factor_val_desigualdad_2<1
    %Si es menor que 1, calculamos la parte derecha de la desigualdad
    disp('Cota superior del error relativo ||Delta x||/||x||')
    aux=(norm(deltaA,'Inf')/norm(A,'Inf'))+(norm(deltab,'Inf')/norm(b,'Inf'));
    disp((cond(A)/(1-norm(inv(A)*deltaA,'Inf')))*(aux));
else
    disp('No se puede calcular la cota por la expresión');
end