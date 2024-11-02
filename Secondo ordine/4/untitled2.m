R1=3/2;
R2=3/2;
R3=1/3;
gm=2/3;
L=2;
Ig1=2/3;
Vg2=8/3;
C=2;
G0=0;
G1=1/R1;
G2=1/R2;
syms Vc Il I0 V0;
G=[G1, 0, 0, 0; 1, -1, 0, 0; 1, 0, -1, 0; gm, -gm, 1, G2];
I=[-I0, Vc, V0, 0];
E=I/G;
% sostituire i valori di A e B ottenuti nella "Command Window" ricordando che:
% x1=vc x2=iL 
% infine g=i0 
VC0 = 3; % le condizioni iniziali le abbiamo calcolate nelle slide
IL0 = 1;
Ir3=(E(3)-E(2))/R3;
Vr2=-E(4);
Vr1=-E(1);
eq1=(Ir3-Il)/C
eq2=(-Vr2+Vr1-Vc)/L
syms t x1(t) x2(t);
x=[x1(t); x2(t)];
g=[V0; I0];
A = [3/2, -1/2;  
     -5/4, 0];       
B = [ -3/2, 0;
     -3/4, 3/4];
Dx = [diff(x1,t)== A(1,:)*x + B(1,:)*g, 
      diff(x2,t)== A(2,:)*x + B(2,:)*g];
cond_ini = [x1(0)==VC0,
            x2(0)==IL0];
S = dsolve(Dx,cond_ini);
simplify(S.x1)
simplify(S.x2)
