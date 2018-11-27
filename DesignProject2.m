format long
syms R_1 R_2

% capacitor values from the kit list
capacitor_values = [100*10^-12, 220*10^-12, 330*10^-12,...
    470*10^-12, 1*10^-9, 1.5*10^-9, 2.2*10^-9, 3.3*10^-9,...
    4.7*10^-9, 10*10^-9, 15*10^-9, 22*10^-9, 33*10^-9, 47*10^-9,...
    .1*10^-6, .15*10^-6, .22*10^-6, .33*10^-6, .47*10^-6, 1*10^-6];

% resistor values from the kit list
resistor_values = 10^3*[100*10^-3, 200*10^-3, 510*10^-3, 750*10^-3, 1,...
    1.1, 1.3, 1.6, 2, 2.2, 3.3, 5.1, 7.5, 10, 15,20, 33, 51, 75, 100,...
    200, 510];

% use the functions to test possible values
disp('Low Frequency')
test_possible(resistor_values, capacitor_values, 180, 0.7);
disp('Mid Frequency')
test_possible(resistor_values, capacitor_values, 1e03, 0.7);
disp('High Frequency')
test_possible(resistor_values, capacitor_values, 5.6e03, 0.7);

% test usable values
function y = test_possible(rv, cv, f_c, Q_f)
for R1 = rv
    for R2 = rv
        for C = cv
            y = test(R1, R2, C, f_c, Q_f);
        end
    end
end
end
    
% test function to determine whether the the values fall in the desired
% tolerances
function y = test(R1, R2, C, f_ci, Q_fi)
%center frequency
f_c = 1/(2*pi*C*sqrt(R1*R2));

%resonant gain
A_r = -R2/(2*R1);

%quality factor
Q_f = 1/2*sqrt(R2/R1);

%final test
if per_err(Q_fi, Q_f) <= 10 && per_err(f_ci, f_c) <= 10
    disp(['R1 = ',num2str(R1), ' | R2 = ', num2str(R2), ' | C = ',...
        num2str(C),' | A_r = ', num2str(A_r), ' | Q_f = ',...
        num2str(Q_f), ' | f_c = ',  num2str(f_c)])
    y = true;
else
    y = false;
end
end

function error = per_err(ideal, observed)
error = abs((ideal-observed)/ideal*100);
end