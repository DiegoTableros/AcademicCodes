%Introducimos los puntos {-5,-4.5,...,4.5,5}
x=[-5.5:1:5.5]'; x(1)=-5; x(12)=5;
y=zeros(12,1);
%Evaluamos en W_9(x) y graficamos
for k=1:12
    res=1;
    for i=-4:4
        res=res*(x(k)-i);
    end
    y(k)=res;
    plot(x(k),y(k),'o','markersize',7,'markerfacecolor','y',...
        'HandleVisibility','off'); hold on;
end
%Imprimimos los valores obtenidos
disp('Evaluaciones de w_9(x_i) con x_i en {-5,-4.5,...,4.5,5}');
disp([x,y]);
%Graficación de w_9(x) en [-5,5] (OPCIONAL)
x=-5:0.1:5; y=x;
for k=1:length(x)
    res=1;
    for i=-4:4
        res=res*(x(k)-i);
    end
    y(k)=res;
end
plot(x,y,'b--','linewidth',2);
xlabel('x'); ylabel('w_9(x)'); legend('w_9(x)'); axis square;
%Ejes coordenados (OPCIONAL)
plot([-5.5,5.5],[0,0],'k','HandleVisibility','off');
plot([0,0],[-362880,362880],'k','HandleVisibility','off');