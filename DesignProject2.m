format long
syms R1

C = 1*10^-6;
%R1 = ;
R2 = 10 * 10^3;
frequecy = 180;


center_frequency = 1/(2*pi*C*sqrt(R1*R2));

double(solve(center_frequency==frequecy,R1))
