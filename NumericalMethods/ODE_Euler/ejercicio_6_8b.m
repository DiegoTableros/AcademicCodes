%Función de la EDO y'=f(x,y)
f=@(x,y) -(y.^3)./2;
%Función solución y
y=@(x) 1./sqrt(1+x);

%Tamaño de paso (ESCRIBIR)
h=0.5;
%Límites del método y número de iteraciones
a=0; b=2; n=(b-a)/h;
%Tabla de valores del método
sol=zeros(n+1,2);
%Valores iniciales (x0,y0)
sol(1,1)=0; sol(1,2)=1;
sol(:,1)=a:h:b;
%Método de Euler
for k=2:n+1
    %Calculamos yk con los anteriores
    %yk=x_{k-1}+h*f(x_{k-1},y_{k-1});
    sol(k,2)=sol(k-1,2)+h*f(sol(k-1,1),sol(k-1,2));
end
%Cálculo de los valores reales
sol_real=y(sol(:,1));
%Errores
error=abs(sol(:,2)-sol_real);
sol=[sol,sol_real,error];
%Impresiones y graficación
fprintf('Método de Euler con tamaño de paso %f\n',h);
disp('    x_n       y_n       y(x_n)    |y_n-y(x_n)|');
disp(sol);