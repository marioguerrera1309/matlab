R=1/2;
gamma=1/3;
C=1/2;
L=1/4;
V0=360;
w=2;
G=1/R;
Yc=-(w*C)/j;
Yl=1/(j*w*L);
MG=[2*G, -G, 0, -G;
    -G, (2*G)+Yl, -G, 0;
    0, -G, Yc+G, -Yc;
    -G, 0, -Yc, Yc+G];
I=[0; 0; 0; 0];
%sommo riga 1, 0 e 3 nella 0
MG(1, :)=[0, 0, 0, 0];
MG(3, :)=[0, 0, 0, 0];
MG(1, 1)=1;
I(1)=V0;
MG(3, 3)=1;
MG(3, 1)=-gamma;
E=MG\I;
VC0=real(E(4)-E(3))
IL0=real(Yl*(E(2)))
syms V0 Il Vc;
MG1=[G, -G, 0, 0, 0;
    -G, 3*G, -G, 0, -G;
    0, -G, 2*G, -G, 0;
    0, 0, -G, G, 0;
    0, -G, 0, 0, G];
I1=[0; 0; -Il; 0; 0];
%sommiamo riga 1, 0, 4 e 5 in 0
MG1(1, :)=[0, 0, 0, 0, 0];
MG1(4, :)=[0, 0, 0, 0, 0];
MG1(5, :)=[0, 0, 0, 0, 0];
MG1(1, 1)=1;
I1(1)=V0;
MG1(4, 4)=1;
MG1(4, 2)=-gamma;
MG1(5, 5)=1;
MG1(5, 4)=-1;
I1(5)=Vc;
E1=MG1\I1;
eq1=(G*(E1(2)-E1(5)))/C;
eq2=(E1(4)/L)-((E1(4)-E1(3))/L);
% x1=vc x2=iL 
% g=V0 
syms t x1(t) x2(t);
V0  = 360*cos(2*t);
x=[x1(t); x2(t)];
g=[V0];
A = [-8/3, -1/3;  
     4/3, -4/3];       
B = [ 4/3;
     4/3];
Dx = [diff(x1,t)== A(1,:)*x + B(1,:)*g, 
      diff(x2,t)== A(2,:)*x + B(2,:)*g];
cond_ini = [x1(0)==VC0,
            x2(0)==IL0];
S = dsolve(Dx,cond_ini);
Vc=simplify(S.x1)
Il=simplify(S.x2)
%Vab=E1(2);
Vab=(V0/2)-(Il/8)+(Vc/2);
simplify(Vab)