R1=10;
R2=10;
R3=20;
r=2;
L=1/40;
C=1/200;
%Vg=60;
%Ig=9;
G1=1/R1;
G2=1/R2;
G3=1/R3;
% MG=[1, -1, 0;
%     G3, -1-(r*G1), 1;
%     0, G1, 0];
% I=[Vg; 0; Ig];
% E=MG\I;
% Ir1=G1*E(2);
% Vr3=E(1);
% Vc0=Vr3-Vg+(r*Ir1)
% Il0=Ir1+Ig
VC0=108;
IL0=18;
syms Vc Il Ig Vg
MG=[G2, 0, 0, G1;
    1, 0, 0, 1;
    0, 0, 1, -1-(r*G1);
    0, -1, 1, 0];
I=[Ig-Il; Vg; 0; Vc];
MG 
I
E=MG\I;
E