u = RepUtils;

A = 6;
T = 2;
tau = T/5;
% Número máximo de coeficientes
nmax = 20;

% Periodo a representar
numTs = 10;
presT = 1000;


%% a) N coeficientes de Fourier
t = 0:T/presT:T*numTs;
n = -nmax:nmax;

cn = calcular_cn(A, tau, T, n);
u.graficarBarras(n, cn, 1, "Coeficientes Cn", "n", "valor");

%% b) Representar 10 peridos de x
x = x_def(A, T, tau, t, n);
u.graficar(t, x, 2, "Función x(t)", "tiempo", "amplitud");


%% d) Potencia media por frecuencia
pm_f = sum(abs(cn).^2);
disp(['Potencia media por los coeficientes: ' num2str(pm_f)]);

%% d) Potencia media por tiempo
pm_t = sum(x.^2)/(T*numTs);
disp(['Potencia media por tiempo: ' num2str(pm_t)]);


function cn = calcular_cn(A, T, tau, n)
    cn = A*tau/T*sinc(n/T*tau);
end

function x = x_def(A, T, tau, t, ns)
    M = zeros(length(ns), length(t));
    for n = 1:length(ns)
        M(n,:)= calcular_cn(A, T, tau, n) * exp(2j*pi/T*t*n);
    end
    x = real(sum(M));
end

