function [answer,errest,flag,nfe] = Adapt(f,a,b,abserr,relerr)
%  Estimate the definite integral of f(x) from a to b using an
%  adaptive quadrature scheme based on Gauss-Kronrod (3,7) formulas.  
%  REQUIRES Add.m and Quad.m.
%
% Input parameters:
%    f     = name of the function defining f(x).
%   a, b   = end points of integration interval.
%   abserr = absolute error tolerance desired.
%   relerr = relative error tolerance desired.
%
% Output parameters:
%   answer = computed estimate of the integral.
%   errest = estimate of the absolute error in answer.
%   flag   = 0  for normal return;
%          = 1  insufficient storage in queue.
%          = 2  too many function evaluations.

%Número máximo de elementos en la cola y creación de la Queue
maxq = 120;
queue = zeros(maxq,4);
%Número máximo de evaluaciones de la función
maxfe = 3577;

%  Test input data.
if relerr < 10*eps
    error('relerr < 10*eps is not allowed in Adapt.')
end
if abserr < 0
    error('abserr <= 0 is not allowed in Adapt.')
end

%  Initialization.
%Inicialización de la cola y otros parametros
length = 0;
top = 1;
bottom = 1;
nfe = 0;

%  Form an initial approximation answer to the integral over [a,b].
%  If it is not sufficiently accurate, initialize the queue and
%  begin the main loop.

%Calculamos una aproximación inicial para comenzar el proceso
[q,e,nfe] = Quad(f,a,b,nfe);
%Guardamos la respuesta global y el error global
answer = q; errest = e;

%Si nuestra aproximación inicial es menos exacta de lo que pedimos
if abs(errest)>max(abserr,relerr*abs(answer))
    %Comenzamos el proceso metiendo a la cola para procesar
    [queue,length,bottom] = Add(queue,q,e,a,b,length,bottom);
end

%  Main loop; if queue is empty then return, else subdivide the top entry.
%Mientras haya elementos en la cola ...
while length > 0
    %  Remove the top entries from the queue.
    q = queue(top,1);
    e = queue(top,2);
    alpha = queue(top,3);
    beta =  queue(top,4);
    %Como sacó un elemento decrece en 1
    length = length - 1;
    %Forma de moverse condicionada para que no haya error de indice
    if top < maxq
        top = top + 1;
    else
        top = 1;
    end

    %Calcula el centro del intervalo [alpha,beta]
    h = (beta-alpha)/2;
    %Calcula la integral en los intervalos [alpha,mitad],[mitad,beta]
    [ql,el,nfe] = Quad(f,alpha,alpha+h,nfe);
    [qr,er,nfe] = Quad(f,alpha+h,beta,nfe);

    %  Update answer and the error estimate.
    %Actualizamos la respuesta general con el resultado nuevo
    answer = answer + ((ql + qr) - q);
    errest = errest + ((el + er) - e);

    %  Test for failures.
    %Se acabó el espacio, demasiados intervalos en la Queue
    if length >= maxq - 1
        flag = 1;
        return;
    end
    %Demasiadas evaluaciones de función
    if nfe >= maxfe
        flag = 2;
        return;
    end

    %  Test for convergence.
    %Vemos si nuestra aproximación ya es lo suficientemente buena
    tol = max(abserr, relerr * abs(answer));
    if abs(errest) <= tol
        %Si sí, acabamos el proceso
        flag = 0;
        return;
    end
    
    %Sino, aún no tenemos una respuesta lo suficientemente buena
    %  Add new subintervals to queue if errors are too big.
    tol = tol * h / (b - a);
    %Si el intervalo izquierdo tiene demasiado error, se mete a la Queue
    if abs(el) > tol
        [queue,length,bottom] = Add(queue,ql,el,alpha,alpha+h,length,bottom);
    end
    %Si el intervalo derecho tiene demasiado error, se mete a la Queue
    if abs(er) > tol
        [queue,length,bottom] = Add(queue,qr,er,alpha+h,beta,length,bottom);
    end
end

%Si llega aquí terminó todos los elementos de la Queue y lo logra
flag = 0;
