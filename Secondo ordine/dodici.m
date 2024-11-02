R1=1;
R2=2;
R3=3;
R4=1/2;
G1=1/R1;
G2=1/R2;
G3=1/R3;
G4=1/R4;
L1=1;
L2=2;
a=3;
syms Vg1 Ig2 Il1 Il2
MG=[G1*(a+1), G2, -G2, 0, 0;
    1, -1, 0, 0, 0;
    0, -G2, G2, 0, 0;
    -G1*a, 0, 0, G4, -G4;
    0, 0, 0, -G4, G3+G4];
I=[Il1; Vg1; -Il2; 0; (Il2+Ig2)];
E=MG\I;
Vr4=E(4)-E(5);
V=E(1)-E(4);
Vr2=E(2)-E(3);
Vr1=E(1);
eq1=(Vr4/L2)-(V/L2)-(Vg1/L2)-(Vr2/L2);
eq2=(Vg1/L1)-(Vr1/L1);
% x1=Il1 x2=Il2 
% condizioni iniziali
Il10 = 30;
Il20 = -90;
% generatori
Vg1  = 30;
Ig2  = 20;
syms t x1(t) x2(t);
x=[x1(t); x2(t)];
g=[Vg1; Ig2];
A = [-1, -3/2;  
     -1/4, 1/4];       
B = [ -1/2, -3/2;
     1, 0];
Dx = [diff(x1,t)== A(1,:)*x + B(1,:)*g, 
      diff(x2,t)== A(2,:)*x + B(2,:)*g];
cond_ini = [x1(0)==Il10,
            x2(0)==Il20];
S = dsolve(Dx,cond_ini);
simplify(S.x1)
simplify(S.x2)