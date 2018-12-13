format short
%Data extracted from oscilloscope
filename = "F0022CH1.CSV";
%M = csvread(filename, 0, 3);
%t = M(1:end, 1);
%V_s1 = M(1:end, 2);
t = 0:.001:2;

f_mid = 261.6255; %Hz
f_low = 32.70; %Hz
f_high = 2093.00; %Hz

V_a = 1/2*cos(2*pi*f_low*t);
V_b = 1/2*cos(2*pi*f_mid*t);
V_c = 1/2*cos(2*pi*f_high*t);

V_s = V_a + V_b + V_c;
plot(V_s)
% Filter Properties
C1 = 3.3e-07;
R1 = 2000;
R2 = 3300;
C2 = 1*10^-7;
R3 = 1100;
R4 = 2200;
C3 = 2.2*10^-8;
R5 = 1000;
R6 = 2000;

% Voltages after band pass filters (Volts)
Vas = V_s* -R2/(2*R1);
Vbs = V_s* -R4/(2*R3);
Vcs = V_s* -R6/(2*R5);

% Potentiometer proportions (out of one)
Pa = 0;
Pb = 0;
Pc = 0;

% Amplifier resistances (Ohms)
Rz = 1 *10^3;
Rf = 2 *10^3;
Ra = 5.1 *10^3;
Rb = 5.1 *10^3;
Rc = 5.1 *10^3;

% Calcultated potentiometer resistances (do not alter)
Rpa = Pa*10*10^3;
Rpb = Pb*10*10^3;
Rpc = Pc*10*10^3;

%Output Voltage
V_out = (Rpa+2000)*Rf/(Rz*Ra)*Vas + (Rpb+2000)*Rf/(Rz*Rb)*Vbs + (Rpc+2000)*Rf/(Rz*Rc)*Vcs;


plot(t, V_out, 'g');
hold on
title('Voltage vs. Time')
xlabel("Time")
ylabel("Volts")



