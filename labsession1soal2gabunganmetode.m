
clc;
clear;

% Fungsi dan parameter
f = @(x) cos(x) - x;
df = @(x) -sin(x) - 1;

epsilon = 0.0001;
max_iter = 100;

% =================================
% METODE NEWTON-RAPHSON
% =================================

x0 = 0.5;

fprintf('=== NEWTON-RAPHSON ===\n');

if df(x0) == 0
    disp('Turunan awal sama dengan nol.');
else
    for i = 1:max_iter
        x1 = x0 - f(x0)/df(x0);

        if abs(f(x1)) < epsilon
            break;
        end

        x0 = x1;
    end

    fprintf('Akar = %.8f\n', x1);
    fprintf('f(x) = %.8f\n', f(x1));
    fprintf('Iterasi = %d\n', i);
end

% =================================
% METODE SECANT
% =================================

x0 = 0.5;
x1 = 1.0;

fprintf('\n=== METODE SECANT ===\n');

if f(x0) == f(x1)
    disp('Nilai fungsi awal sama.');
else
    for i = 1:max_iter
        x2 = x1 - (f(x1)*(x1-x0))/(f(x1)-f(x0));

        if abs(f(x2)) < epsilon
            break;
        end

        x0 = x1;
        x1 = x2;
    end

    fprintf('Akar = %.8f\n', x2);
    fprintf('f(x) = %.8f\n', f(x2));
    fprintf('Iterasi = %d\n', i);
end

