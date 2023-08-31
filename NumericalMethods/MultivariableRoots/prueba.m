%Método Gauss-Siedel
%Definimos la tolerancia
TOL=input('Tolerancia deseada: ');
%Definimos el intervalo del dominio de la función D
D=[0:0.001:1.5];
%Declaramos el vector arbitrario x_0 en el dominio 
x0=[0,0];
%Definimos las funciones de punto fijo
g1=@(x1,x2) (x1.^2+x2.^2+8)./10;
g2=@(x1,x2) (x1.*x2.^2+x1+8)./10;
%Lo unico que cambia en este metodo es que las iteraciones hechas 
%en los x1,...,xi-1 anteriores al xi se toman como las que se hacen 
%en el k-ésimo paso, para acelerar la convergencia
%Declaramos el vector que irá iterando en cada valor, empezando
%a evaluar en el vector v0
%Generamos un vector de ceros llamado x para que en él se vayan
%almacenando los valores de la función evaluado en los xi, ya no podemos
%ponerlo como un vector de dos entradas iguales porque los valores de los
%xi-1 se toman como los que ya se evaluan en el mismo k-ésimo paso
x=zeros(1,2);
x(1)=[g1(x0(1),x0(2))];
x(2)=[g2(x(1),x0(2))];
%Mostramos la primera evaluación
evaluaciones=1;
%Vamos a generar la iteración en el k-paso para ver qué tan bien se
%aproxima en la k-ésima evaluación
while(norm(x-x0,'inf')>TOL)

%Vamor evaluando las funciones de punto fijo y en la i-ésima función
%los valores de los x_{i-1} que ya hemos calculado en este mismo paso los
%vamos metiendo en las entradas anteriores a la i-ésima
x(1)=g1(x0(1),x0(2));
x(2)=g2(x(1),x0(2));
%Aumentamo a las evaluaciones uno cada vez que  realice un ciclo de
%evaluación
evaluaciones=evaluaciones+1;
%disp('||x-x0||');
%disp(norm(x-x0,'inf'));
end

%Ahora simplemente mostramos las iteraciones realizadas hasta llegar al
%la iteración donde se halla alcanzado la tolerancia deseada
disp('Iteraciones hechas');disp(evaluaciones);
disp('x');disp(x);