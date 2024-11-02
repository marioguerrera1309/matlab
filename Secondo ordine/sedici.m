R0=5;
R1=15;
R2=2;
G0=1/R0;
G1=1/R1;
G2=1/R2;
a=1;
C=1/9;
L=2;
syms I0 Vc Il
MG=[G2+G0, -G2, 2*G1, G1;
    -G2, G2, 0, 0;
    -1, 0, 1-a, 0;
    0, 0, 1, -1];
I=[I0+Il; -Il; 0; Vc];
E=MG\I;
eq1=E(3)-E(4);
eq2=G2*(E(1)-E(4));
% x1=vc x2=iL 
% g=V0 
VC0 = 0;
IL0 = 0;
I0  = 2;
syms t x1(t) x2(t);
x=[x1(t); x2(t)];
g=[I0];
A = [1, 0;  
     1/3, 0];       
B = [ 0;
     -5/2];
Dx = [diff(x1,t)== A(1,:)*x + B(1,:)*g, 
      diff(x2,t)== A(2,:)*x + B(2,:)*g];
cond_ini = [x1(0)==VC0,
            x2(0)==IL0];
S = dsolve(Dx,cond_ini);
Vc=simplify(S.x1)
Il=simplify(S.x2)