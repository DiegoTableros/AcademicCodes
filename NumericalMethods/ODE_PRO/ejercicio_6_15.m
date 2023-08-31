%Definimos la función f(x,y)
f=@(x,y) 10*(y-x);
%Definimos la función solución
y_sol=@(x,y) x+(1/10);
%Tamaño de paso
h=1/80;
%Numero de iteraciones (opcionalmente introduce límite sup)
limite=10; n=ceil(limite/h);
%METODO DE HEUN
Y_i=1/10; X_i=0;
sol_H=zeros(n+1,2);
sol_H(1,1)=X_i; sol_H(1,2)=Y_i;
for i=2:n+1
    %Calculo de solución
    Y_i=Y_i+(h/2)*(f(X_i,Y_i)+f(X_i+h,Y_i+h*f(X_i,Y_i)));
    X_i=X_i+h;
    sol_H(i,1)=X_i; sol_H(i,2)=Y_i;
end

%METODO DE EULER
Y_i=1/10; X_i=0;
sol_E=zeros(n+1,2);
sol_E(1,1)=X_i; sol_E(1,2)=Y_i;
for i=2:n+1
    Y_i=Y_i+h*f(X_i,Y_i);
    X_i=X_i+h;
    sol_E(i,1)=X_i; sol_E(i,2)=Y_i;
end

%Calculamos el error con de Euler con respecto a Heun y a la sol
error_EH=abs(sol_E(:,2)-sol_H(:,2));
error_real=abs(sol_E(:,2)-y_sol(sol_E(:,1),sol_E(:,2)));

disp(error_real);