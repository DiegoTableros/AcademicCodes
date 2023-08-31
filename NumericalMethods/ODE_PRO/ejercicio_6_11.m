%Definimos la función f(x,y)
f=@(x,y) -y^3/2;
%Definimos la función solución
y_sol=@(x,y) 1/sqrt(1+x);
%Definimos el valor inicial (se asume que empiezas en x=0)
Y_i=1; X_i=0;
%Tamaño de paso
h=1/160;
%Numero de iteraciones (opcionalmente introduce límite sup)
limite=1; n=limite/h;
%METODO DE HEUN
sol=zeros(n+1,3);
sol(1,1)=X_i; sol(1,2)=Y_i;
for i=2:n+1
    %Calculo de solución
    Y_i=Y_i+(h/2)*(f(X_i,Y_i)+f(X_i+h,Y_i+h*f(X_i,Y_i)));
    X_i=X_i+h;
    sol(i,1)=X_i; sol(i,2)=Y_i;
    %Calculo de error local
    sol(i,3)=abs(Y_i-y_sol(X_i,Y_i));
end
%Mostramos soluciones de x=0.5 y x=1
fprintf('Método de Heun con tamaño de paso %f\n',h);
disp(sol(n/2+1,:));
disp(sol(n+1,:))