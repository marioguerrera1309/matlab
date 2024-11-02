g0=1/5;
g1=1/15;
g2=1/15;
g3=1/15;
g4=1/15;
G=[g0+g1+g3+g4, -g0, -g1-g4; -g0-g1-g4, g0, g1+g2+g4; 0, 0, 1];
syms e0 e1 e2 t;
e=[e0; e1; e2];
i0=2;
Vct=-6*exp(-t)+6;
I=[-i0; i0; Vct];
e=G\I;
Ir3=-g3*e(1);
Ir3