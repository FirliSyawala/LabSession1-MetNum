clc;
clear;

% Metode Secant
f = @(x) cos(x) - x;

x0 = 0.5;
x1 = 1.0;
epsilon = 0.0001;
max_iter = 100;

% Cek syarat awal
if f(x0) == f(x1)
    disp('Nilai fungsi awal sama, iterasi tidak dapat dilakukan.');
else
    fprintf('METODE SECANT\n');
    fprintf('Iterasi\t x\t\t f(x)\n');

    for i = 1:max_iter

        x2 = x1 - (f(x1)*(x1-x0))/(f(x1)-f(x0));

        fprintf('%d\t %.8f\t %.8f\n', i, x2, f(x2));

        if abs(f(x2)) < epsilon
            break;
        end

        x0 = x1;
        x1 = x2;
    end

    fprintf('\nAkar persamaan = %.8f\n', x2);
    fprintf('Nilai f(x) = %.8f\n', f(x2));
    fprintf('Jumlah iterasi = %d\n', i);
end

