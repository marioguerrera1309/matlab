R=2;
R0=1;
gamma=2;
C=1/5;
I0=100;
L=1;
Vga=260;%ampiezza generatore
G0=1/R0;
G1=1/R;
G2=1/R;
G3=1/R;
G=[G0+G1, -G1, 0; -G1, G1+G3, G2; -gamma, -1, 1+gamma];
I=[I0; 0; 0];
E=G\I;
Vc0=E(1)-E(3);
Il0=G3*E(2);
syms Vg Vc Il
eq1=(((Vg - Vc)/R)+Il-(((1+gamma)*Vc)/R))/C
eq2=(-(R*Il)-(gamma*Vc)+Vg-Vc)/L
% sostituire i valori di A e B ottenuti nella "Command Window" ricordando che:
% x1=vc x2=iL 
% coefficiente di Vc di eq1 in A(riga 1 colonna 1)
% coefficiente di Vc di eq2 in A(riga 2 colonna 1)
% coefficiente di Il di eq1 in A(riga 1 colonna 2)
% coefficiente di Il di eq2 in A(riga 2 colonna 2)
% coefficiente di Vg di eq1 in B(riga 1)
% coefficiente di Vg di eq2 in B(riga 2)
VC0 = 20; %cond. iniziali
IL0 = 5;
syms t x1(t) x2(t);
V0  = 260*cos(t);
x=[x1(t); x2(t)];
g=[V0];
A = [-10, 5;  
     -3, -2];       
B = [ 5/2;
     1];
Dx = [diff(x1,t)== A(1,:)*x + B(1,:)*g, 
      diff(x2,t)== A(2,:)*x + B(2,:)*g];
cond_ini = [x1(0)==VC0,
            x2(0)==IL0];
S = dsolve(Dx,cond_ini);
simplify(S.x1)
simplify(S.x2)
%Ir=((1+gamma)*simplify(S.x1))/R;
M1=[1, 0, -1, 0; 1, 0, 0, 0; -gamma, -1, 1+gamma, 0; 0, -G1, 0, G1];
I1=[simplify(S.x1); V0; 0; -simplify(S.x2)];
E1=M1\I1;
Ir=G1*(E1(1) - E1(2));
simplify(Ir)