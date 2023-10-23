u = RepUtils;

A = 6;
T = 2;
tau = T/5;
nmax = 20;

numTs = 10;
presT = 100000;

t = 0:T/presT:T*numTs;
n = -nmax:nmax;

cn = calcular_cn(A, tau, T, n);
u.graficarBarras(n, cn, 1, "Coeficientes Cn", "n", "valor");

x = x_def(A, T, tau, t, n);
u.graficar(t, x, 2, "Función x(t)", "tiempo", "amplitud");

x = x_def_2(A, T, tau, t, n);
u.graficar(t, x, 3, "Función x(t)", "tiempo", "amplitud");

p = x.^2;
u.graficar(t, p, 4, "Potencia de x(t)", "tiempo", "potencia");


function cn = calcular_cn(A, T, tau, n)
    cn = A*tau/T*sinc(n/T*tau);
end

function x = x_def(A, T, tau, t, ns)
    x = zeros(size(t));
    for n = ns
        x = x + calcular_cn(A, T, tau, n) * exp(1j*n*2*pi/T*t);
    end
    x = real(x);
end
     
function x = x_def_2(A, T, tau, t, ns)
    M = zeros(length(ns), length(t));
    for n = 1:length(ns)
        M(n,:)= calcular_cn(A, T, tau, n) * exp(1j*n*2*pi/T*t);
    end
    x = real(sum(M));
end

