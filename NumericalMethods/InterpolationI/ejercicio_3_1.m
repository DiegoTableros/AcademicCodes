%Grafiquemos la función seno en [0,2pi]
x=0:2*pi/100:2*pi;
y_f=sin(x);
y_L=0.*x;
plot(x,y_f,'--',x,y_L,'x'); hold on;
plot(0,0,'bo',pi,0,'bo',2*pi,0,'bo'); hold on;
axis square; axis([-1 2*pi+1 -1.2 1.2]);
legend('sin(x)','p(x)');
xlabel('x'); ylabel('y');