%Introducimos las matrices A y S
A=[0.6,-1.0,0.0,0.0,0.0,0.0,0.0,-0.6,0,0;
    0.8,0.0,0.0,0.0,0.0,0.0,1.0,0.8,0.0,0.0;
    0.0,1.0,-0.6,0.0,0.0,0.0,0.0,0.0,0.6,0.0;
    0.0,0.0,0.8,0.0,0.0,0.0,0.0,0.0,0.8,1.0;
    0.0,0.0,0.0,1.0,-1.0,0.0,0.0,0.0,-0.6,0.0;
    0.0,0.0,0.0,0.0,0.0,0.0,-1.0,0.0,-0.8,0.0;
    0.0,0.0,0.0,0.0,1.0,-1.0,0.0,0.6,0.0,0.0;
    0.0,0.0,0.6,0.0,0.0,1.0,0.0,0.0,0.0,0.0];
S=eye(10); S(1,1)=4800; S(2,2)=10000; S(3,3)=4800;
S(4,4)=10000; S(5,5)=10000; S(6,6)=10000; S(7,7)=3000;
S(8,8)=4800; S(9,9)=4800; S(10,10)=3000;
%Calculamos K como K=ASA'
K=A*S*A';
%Resolvemos el sistema Kx=p con tres lados derechos distintos p1,p2,p3
p1=zeros(8,1); p1(2)=-1.0;
p2=zeros(8,1); p2(4)=-1.0;
p3=zeros(8,1); p3(6)=-1.0;
%Aplicando FACTOR/SOLVE
[L,U,P,cond]=FACTOR(K);
[x1]=SOLVE(L,U,P,p1);
[x2]=SOLVE(L,U,P,p2);
[x3]=SOLVE(L,U,P,p3);
%Encontrando los vectores f correspondientes f=(SA')x e imprimiendolos
f1=S*A'*x1; disp('f1:'); disp(f1);
f2=S*A'*x2; disp('f2:'); disp(f2);
f3=S*A'*x3; disp('f3:'); disp(f3);