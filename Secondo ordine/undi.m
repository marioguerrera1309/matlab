R=5;
G=1/R;
C1=1/5;
C2=2/25;
a=4;
%V1=12;
%I2=6;
% MG=[G, 0, G*a, 0;
%     0, G, 0, 0;
%     0, 0, G, G;
%     0, 0, -1, 1];
% I=[0; I2; -I2; V1];
% E=MG\I;
%condizioni iniziali
%VC10=E(1)-E(2);
%VC20=E(1)-E(3);
VC10=54;
VC20=105;
syms VC1 VC2 V1 I2
MG=[1, 0, 0, 0, 0, 0;
    0, 1, 0, 0, -1, 0;
    0, -G, 2*G, 0, 0, -G;
    0, 0, 0, G*(a+2), -G, 0;
    -G, 2*G, -G, G*(-a-1), G, 0;
    0, 0, 0, 0, 0, 1];
I=[VC2; VC1; 0; 0; I2; V1];
E=MG\I;
Ir1=G*(E(5)-E(4));
Ir2=G*(E(2)-E(1));
eq1=(Ir1/C1)-(I2/C1);
eq2=(Ir2/C2);
% x1=vc1 x2=vc2 
% generatori
V1  = 12;
I2  = 6;
syms t x1(t) x2(t);
x=[x1(t); x2(t)];
g=[V1; I2];
A = [-3/4, 1/2;  
     1/4, -1];       
B = [1/4, -5/2;
     3/4, 15/2];
Dx = [diff(x1,t)== A(1,:)*x + B(1,:)*g, 
      diff(x2,t)== A(2,:)*x + B(2,:)*g];
cond_ini = [x1(0)==VC10,
            x2(0)==VC20];
S = dsolve(Dx,cond_ini);
simplify(S.x1)
simplify(S.x2)