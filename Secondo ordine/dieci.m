R1=1/2;
R2=1/4;
a=1/2;
L1=1/2;
L2=1;
G1=1/R1;
G2=1/R2;
syms V1 V2 Il1 Il2
MG=[G2*(1-a), G2*(a-1), 0, 0, 0;
    -G2, G2, G1, G1, -G1;
    0, -1, 1, 0, 0;
    0, 0, 1, -1, 0;
    0, 0, 0, -G1, G1];
I=[-Il2; Il1; V2; V1; Il2];
E=MG\I;
Vr1p=E(3);
Vl1=-E(4);
Vr1=E(4)-E(5);
Va=-E(1);
eq1=(Vr1p/L1)-(V1/L1)
eq2=(Vl1/L2)+(Vr1/L2)-(Va/L2)
% x1=Il1 x2=Il2 
% condizioni iniziali
IL10 = 2;
IL20 = 0;
% generatori
V1  = 1;
V2  = 2;
syms t x1(t) x2(t);
x=[x1(t); x2(t)];
g=[V1; V2];
A = [1, -1;  
     0, -1];       
B = [ -2, 0;
     1, -1];
Dx = [diff(x1,t)== A(1,:)*x + B(1,:)*g, 
      diff(x2,t)== A(2,:)*x + B(2,:)*g];
cond_ini = [x1(0)==IL10,
            x2(0)==IL20];
S = dsolve(Dx,cond_ini);
simplify(S.x1)
simplify(S.x2)