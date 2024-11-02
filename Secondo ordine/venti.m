R1=2;
R2=1;
R0=1;
G0=1/R0;
G1=1/R1;
G2=1/R2;
C=1;
L=1/3;
a=2;
I0=181;
w=3;
Yc=-(w*C)/j;
Yl=1/(j*w*L);
MG=[G0+G2+Yl, -G2, 0, 0, 0;
    -G2, 3*G2, -G2, 0, 0;
    0, -G2, G1+G2, -G1, 0;
    0, 0, -G1, G1+Yc, -Yc;
    0, 0, 0, -Yc, Yc];
I=[0;0;-I0;I0;0];
MG(5, 4)=a;
MG(5, 5)=-1-a;
E=MG\I;
VC0=real(E(5)-E(4))
IL0=real(Yl*(-E(1)))
syms Il I0 Vc
MG1=[G0+G2, -G0, -G2, 0, 0;
    -G0, G0+G2, -G2, 0, 0;
    -G2, -G2, 3*G2, -G2, 0;
    0, 0, -G2, (2*G1)+G2, -2*G1;
    0, 0, 0, -2*G1, 2*G1];
I1=[-Il; Il; 0; -I0; I0];
%azzero riga 5 e 1
MG1(1, :)=[0, 0, 0, 0, 0]
E1=MG1\I1;
% x1=vc x2=iL 
% g=I0 
syms t x1(t) x2(t);
I0  = 181*cos(3*t);
x=[x1(t); x2(t)];
g=[I0];
A = [-9/8, -1/8;  
     9/8, -15/8];       
B = [ -3/8;
     3/8];
Dx = [diff(x1,t)== A(1,:)*x + B(1,:)*g, 
      diff(x2,t)== A(2,:)*x + B(2,:)*g];
cond_ini = [x1(0)==VC0,
            x2(0)==IL0];
S = dsolve(Dx,cond_ini);
Vc=simplify(S.x1);
Il=simplify(S.x2);
Ir=G1*(E1(4)-E1(3));
simplify(Ir);