clc;
clear;
close all;

% Fungsi persamaan diferensial
f = @(x,y) (x.^2 + 2.*y) ./ (x + 1);

% Parameter awal
x0 = 0;
y0 = 2;
h = 0.2;
N = 2;

% =================================
% 1. METODE EULER
% =================================
x = x0;
y = y0;

for i = 1:N
    y = y + h * f(x,y);
    x = x + h;
end

y_euler = y;

% =================================
% 2. METODE HEUN
% =================================
x = x0;
y = y0;

for i = 1:N
    k1 = f(x,y);
    k2 = f(x+h, y+h*k1);

    y = y + (h/2)*(k1+k2);
    x = x+h;
end

y_heun = y;

% =================================
% 3. METODE RUNGE-KUTTA ORDE 4
% =================================
x = x0;
y = y0;

for i = 1:N
    k1 = f(x,y);
    k2 = f(x+h/2, y+h*k1/2);
    k3 = f(x+h/2, y+h*k2/2);
    k4 = f(x+h, y+h*k3);

    y = y + (h/6)*(k1+2*k2+2*k3+k4);
    x = x+h;
end

y_rk4 = y;

% =================================
% 4. NILAI EKSAK
% =================================
x = 0.4;

y_eksak = (x+1)^2 * ...
    (log(x+1) + 2/(x+1) ...
    - 1/(2*(x+1)^2) + 0.5);

% =================================
% 5. ANALISIS GALAT
% =================================

% Galat mutlak
error_euler = abs(y_eksak-y_euler);
error_heun = abs(y_eksak-y_heun);
error_rk4 = abs(y_eksak-y_rk4);

% Galat relatif
rel_euler = (error_euler/abs(y_eksak))*100;
rel_heun = (error_heun/abs(y_eksak))*100;
rel_rk4 = (error_rk4/abs(y_eksak))*100;

% =================================
% 6. MENAMPILKAN HASIL
% =================================

fprintf('HASIL PERHITUNGAN PDB\n');
fprintf('========================\n');

fprintf('Nilai Eksak = %.9f\n', y_eksak);

fprintf('\nMETODE EULER\n');
fprintf('y(0.4)       = %.9f\n', y_euler);
fprintf('Galat Mutlak = %.9f\n', error_euler);
fprintf('Galat Relatif= %.6f%%\n', rel_euler);

fprintf('\nMETODE HEUN\n');
fprintf('y(0.4)       = %.9f\n', y_heun);
fprintf('Galat Mutlak = %.9f\n', error_heun);
fprintf('Galat Relatif= %.6f%%\n', rel_heun);

fprintf('\nMETODE RUNGE-KUTTA ORDE 4\n');
fprintf('y(0.4)       = %.9f\n', y_rk4);
fprintf('Galat Mutlak = %.9f\n', error_rk4);
fprintf('Galat Relatif= %.6f%%\n', rel_rk4);

