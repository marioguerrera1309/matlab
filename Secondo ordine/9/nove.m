R=1;
G=1/R;
a=1/3;
C=1/3;
L=3/2;
Ig=9;
MG=[G, -G, -a*G;
   -G, 2*G, 0;
   0, 0, G];
I=[0; Ig; -Ig];
E=MG\I;
VC0=E(1)
IL0=-G*E(2)
% syms Il Ig Vc
% VC0=3;
% IL0=-6;
% MG=[G*(1-a), G*(a-1), 0, 0;
%     -G, 2*G, -G, 0;
%     0, 0, -1, 0;
%     0, 0, -G, 2*G];
% I=[-Il; -Ig; Vc; Ig];
% E=MG\I;
% Vr2=E(1)-E(2);
% Vr3=E(3)-E(2);
% Ir2=G*(E(1)-E(2));
% Ir1=G*E(4);
% eq1=(Ir1/C)-((a*Ir2)/C);
% eq2=(Vr2/L)-(Vr3/L);
% Ig=9;
% syms t x1(t) x2(t);
% x=[x1(t); x2(t)];
% g=[Ig];
% A = [-3/2, 3/2;  
%      0, -2];       
% B = [ 3/2; -2/3];
% Dx = [diff(x1,t)== A(1,:)*x + B(1,:)*g, 
%       diff(x2,t)== A(2,:)*x + B(2,:)*g];
% cond_ini = [x1(0)==VC0,
%             x2(0)==IL0];
% S = dsolve(Dx,cond_ini);
% simplify(S.x1)
% simplify(S.x2)