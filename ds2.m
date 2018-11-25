%Data extracted from oscilloscope
filename = "F0022CH1.CSV";
M = csvread(filename, 0, 3);
t = M(1:end, 1);
V_s = M(1:end, 2);

% Filter Properties
C1 = 1*10^-6;
R1 = 10;
R2 = 10;
C2 = 1*10^-6;
R3 = 10;
R4 = 10;
C3 = 1*10^-6;
R5 = 10;
R6 = 10;

% Voltages after band pass filters (Volts)
Vas = V_s* -R2/(2*R1);
Vbs = V_s* -R4/(2*R3);
Vcs = V_s* -R6/(2*R5);

% Potentiometer proportions (out of one)
Pa = 1;
Pb = 1;
Pc = 1;

% Amplifier resistances (Ohms)
Rz = 5 *10^3;
Rf = 5 *10^3;
Ra = 2.2 *10^3;
Rb = 2.2 *10^3;
Rc = 2.2 *10^3;

% Calcultated potentiometer resistances (do not alter)
Rpa = Pa*10*10^3;
Rpb = Pb*10*10^3;
Rpc = Pc*10*10^3;

%Output Voltage
V_out = Rpa*Rf/(Rz*Ra)*Vas + Rpb*Rf/(Rz*Rb)*Vbs + Rpc*Rf/(Rz*Rc)*Vcs;


plot(t, V_out, 'g');
hold on
xlabel("Time")
ylabel("Volts")



