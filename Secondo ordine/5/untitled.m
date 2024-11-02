R=5;
a=4;
C1=1/5;
C2=2/25;
V1=12;
I2=6;
syms I0 V0 Vc1 Vc2;
G1=1/R;
G2=1/R;
G3=1/R;
G4=1/R;
G5=1/R;
G=[G1+G2, -G2-(a*G4)-G3, G3, -G1, (a*G4);
    -G2, G2+G5+G3+G4+(a*G4), -G3, 0, -G4-(a*G4);
    1, 0, -1, 0, 0;
    0, 0, 0, 1, -1;
    0, 0, 0, 0, -1];
I=[I0; 0; Vc1; Vc2; V0];
E=G\I;
Ir3=G3*(E(3)-E(4));
Ir1=G1*(E(1)-E(4));
eq1=(Ir3-I0)/C1
eq2=Ir1/C2
% sostituire i valori di A e B ottenuti nella "Command Window" ricordando che:
% x1=Vc1 x2=Vc2 
% infine g=i0 v0 
Vc1 = 105; % le condizioni iniziali le abbiamo calcolate nelle slide
Vc2 = 54;
%I0  = 6;
%V0  = 12;
syms t x1(t) x2(t);
x=[x1(t); x2(t)];
g=[I0; V0];
A = [-5/6, -1/3;  
     5/12, -5/6];       
B = [ -5/3, 1/2;
     25/3, 5/4];
Dx = [diff(x1,t)== A(1,:)*x + B(1,:)*g, 
      diff(x2,t)== A(2,:)*x + B(2,:)*g];
cond_ini = [x1(0)==Vc1,
            x2(0)==Vc2];
S = dsolve(Dx,cond_ini);
simplify(S.x1)
simplify(S.x2)