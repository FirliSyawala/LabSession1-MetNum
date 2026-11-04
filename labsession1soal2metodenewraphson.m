clc;
clear;

% Metode Newton-Raphson
f = @(x) cos(x) - x;
df = @(x) -sin(x) - 1;

x0 = 0.5;
epsilon = 0.0001;
max_iter = 100;

% Cek turunan awal
if df(x0) == 0
    disp('Turunan awal sama dengan nol, iterasi tidak dapat dilakukan.');
else
    fprintf('METODE NEWTON-RAPHSON\n');
    fprintf('Iterasi\t x\t\t f(x)\n');

    for i = 1:max_iter
        x1 = x0 - f(x0)/df(x0);

        fprintf('%d\t %.8f\t %.8f\n', i, x1, f(x1));

        if abs(f(x1)) < epsilon
            break;
        end

        x0 = x1;
    end

    fprintf('\nAkar persamaan = %.8f\n', x1);
    fprintf('Nilai f(x) = %.8f\n', f(x1));
    fprintf('Jumlah iterasi = %d\n', i);
end

