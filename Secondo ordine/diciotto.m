R0=1;
R1=1/2;
R2=2;
C=1;
L=1/10;
G0=1/R0;
G1=1/R1;
G2=1/R2;
syms Vc Il V0 I0
MG=[G0, 0, G1;
    0, 1, -1;
    -1, 1, 0];
I=[Il-I0; V0; Vc];
E=MG\I
Vr1=-E(3);
Ir0=G0*(-E(1));
Ir2=G2*(E(3)-E(1));
eq1=-(Ir0/C)-(Ir2/C);
eq2=(Vr1/L)-(V0/L);
% x1=vc x2=iL 
% condizioni iniziali
VC0 = 6;
IL0 = -11;
% generatori
V0  = 6;
I0  = 1;
syms t x1(t) x2(t);
x=[x1(t); x2(t)];
g=[V0; I0];
A = [-7/6, 1/3;  
     -10/3, -10/3];       
B = [ 7/6, -1/3;
     -20/3, 10/3];
Dx = [diff(x1,t)== A(1,:)*x + B(1,:)*g, 
      diff(x2,t)== A(2,:)*x + B(2,:)*g];
cond_ini = [x1(0)==VC0,
            x2(0)==IL0];
S = dsolve(Dx,cond_ini);
Vc=simplify(S.x1)
Il=simplify(S.x2)