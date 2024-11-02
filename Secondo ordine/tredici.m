R=1;
G=1/R;
g=1;
C=1/3;
L=4;
R0=3;
G0=1/R0;
IL0=-1;
VC0=0;
% syms Il Vc Vg
% MG=[G, 0, 0, 0, -G;
%     0, 1, 0, 0, 0;
%     0, -G, G, 2*G, -G;
%     0, 0, 1, -1, 0;
%     -G, 0, 0, -G, 2*G];
% I=[-Il; Vc; 0; Vg; 0];
% E=MG\I;
% I0=G0*E(2);
% I3=G*E(4);
% Vr2=E(2)-E(3);
% Vr1=E(1)-E(5);
% Vr4=E(5)-E(4);
eq1=-(I0/C)-(I3/C)-((g*Vr2)/C);
eq2=(Vr1/L)+(Vr4/L)-(Vg/L)-(Vr2/L);
% x1=vc x2=iL 
% g=V0 
V0  = 4;
syms t x1(t) x2(t);
x=[x1(t); x2(t)];
g=[V0];
A = [-4, 0;  
     -1/8, -5/8];       
B = [ 3;
     -1/8];
Dx = [diff(x1,t)== A(1,:)*x + B(1,:)*g, 
      diff(x2,t)== A(2,:)*x + B(2,:)*g];
cond_ini = [x1(0)==VC0,
            x2(0)==IL0];
S = dsolve(Dx,cond_ini);
Vc=simplify(S.x1);
Il=simplify(S.x2);
Vg=4;
MG=[G, 0, 0, 0, -G;
    0, 1, 0, 0, 0;
    0, -G, G, 2*G, -G;
    0, 0, 1, -1, 0;
    -G, 0, 0, -G, 2*G];
I=[-Il; Vc; 0; Vg; 0];
E=MG\I;
V=E(2)-E(3)