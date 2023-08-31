%delta divide el intervalo [0,2pi] en delta intervalos pequeños
delta=1000;
%Creamos el intervalo [0,2pi] con sus divisiones
t=0:2*pi/delta:2*pi;
%Vectores posicion, velocidad y aceleracion de la tierra
r_0=[3*cos(t);2*sin(t);0*t];
v_0=[-3*sin(t);2*cos(t);0*t];
a_0=[-3*cos(t);-2*sin(t);0*t];
%Graficar la orbita de la tierra
plot3(r_0(1,:),r_0(2,:),r_0(3,:),'r','linewidth',3);
%Graficación de ejes coordenados
hold on; axis([-4,4,-2.5,2.5,-0.2,0.2]);
plot3([-4,4],[0,0],[0,0],'k'); xlabel('x');
plot3([0,0],[-2.5,2.5],[0,0],'k'); ylabel('y');
plot3([0,0],[0,0],[-0.2,0.2],'k'); zlabel('z');

%Vectores tangente, normal y binormal
rho=0.2;
tangente=v_0./sqrt(9.*sin(t).*sin(t)+4.*cos(t).*cos(t));
normal=[-tangente(2,:);tangente(1,:);0*t];
binormal=[0*t;0*t;ones(1,delta+1)];
normal_neg=-normal;

%Posición de la luna con respecto al sistema [T,N,B] de la tierra
r_1=rho.*binormal.*sin(20.*t)+rho.*normal_neg.*cos(20.*t);
%Posición de la luna con respecto al marco de referencia de la tierra
r=r_0+r_1;
%Graficar la orbita de la luna alrededor de la tierra mientras ésta orbita
plot3(r(1,:),r(2,:),r(3,:),'b','linewidth',3);

%%%OPCIONAL. Uso del resultado del inciso c)
%%%Generación desde cero del movimiento de la luna, r(t)

r_x=zeros(1,delta+1);
r_y=zeros(1,delta+1);
r_z=zeros(1,delta+1);
for i=1:delta+1
    n=t(i);
    raiz=sqrt(9*sin(n)*sin(n)+4*cos(n)*cos(n));
    %Obtención de las coordenadas de la luna para cada t
    r_x(i)=3*cos(n)+(2*rho*cos(n)*cos(20*n))/raiz;
    r_y(i)=2*sin(n)+(3*rho*sin(n)*cos(20*n))/raiz;
    r_z(i)=rho*sin(20*n);
end
%Graficar la orbita de la luna alrededor de la tierra mientras ésta orbita
plot3(r_x,r_y,r_z,'--k','linewidth',3);
legend('Trayectoria de la tierra', 'Trayectoria de la luna (1)',...
    'Trayectoria de la luna (2)');