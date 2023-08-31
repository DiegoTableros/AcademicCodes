%Definimos la función f(x,y)
f=@(x,y) -y^3/2;
%Definimos la función solución
y_sol=@(x,y) 1/sqrt(1+x);
%Definimos el valor inicial (se asume que empiezas en x=0)
Y_i=1; X_i=0;
%Tamaño de paso
h=0.275;
%Numero de iteraciones (opcionalmente introduce límite sup)
limite=1; n=ceil(limite/h);
%METODO DE HEUN
sol=zeros(n+1,3);
sol(1,1)=X_i; sol(1,2)=Y_i;
for i=2:n+1
    K_0=f(X_i,Y_i);
    K_1=f(X_i+h/2,Y_i+(h/2)*K_0);
    K_2=f(X_i+h/2,Y_i+(h/2)*K_1);
    K_3=f(X_i+h/2,Y_i+h*K_2);
    %Calculo de solución
    Y_i=Y_i+(h/6)*(K_0+2*K_1+2*K_2+K_3);
    X_i=X_i+h;
    sol(i,1)=X_i; sol(i,2)=Y_i;
    %Calculo de error local
    sol(i,3)=abs(Y_i-y_sol(X_i,Y_i));
end
%Mostramos soluciones de x=0.5 y x=1
fprintf('Método de Runge-Kutta con tamaño de paso %f\n',h);
disp(sol(floor(n/2+1),:));
disp(sol(floor(n+1),:))