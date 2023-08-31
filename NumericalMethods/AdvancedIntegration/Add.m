function [queue,length,bottom] = Add(queue,q,e,alpha,beta,length,bottom)
%  Add an entry to the end of the queue.

%bottom es el indice donde se guardó el último elemento
[maxq,cols] = size(queue);
queue(bottom,1) = q;
queue(bottom,2) = e;
queue(bottom,3) = alpha;
queue(bottom,4) = beta;
length = length + 1;
%Técnica de almacenamiento eficiente, volver al inicio
if bottom < maxq 
    bottom = bottom + 1;
else
    bottom = 1;
end
