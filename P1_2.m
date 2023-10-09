A = 6;
T = 2;
tau = T/5;
nmax = 20

numTs = 10;
presT = 100000;

t = 0:T/presT:T*numTs;
n = -nmax:nmax;

cn = calcular_cn(A, tau, T, n);
grid on;
figure(1);
stem(n, cn);

x = x_def(A, T, tau, t, n);
figure(2);
plot(t,x)

x = x_def_2(A, T, tau, t, n);
figure(3);
plot(t,x)

p = x.^2;
figure(4);
plot(t,p)


function cn = calcular_cn(A, T, tau, n)
    cn = A*tau/T*sinc(n/T*tau);
end

function x = x_def(A, T, tau, t, ns)
    x = zeros(size(t));
    for n = ns
        x = x + calcular_cn(A, T, tau, n) * exp(1j*n*2*pi/T*t);
    end
    x =real(x)
end
     
function x = x_def_2(A, T, tau, t, ns)
    M = zeros(length(ns), length(t));
    for n = 1:length(ns)
        M(n,:)= calcular_cn(A, T, tau, n) * exp(1j*n*2*pi/T*t);
    end
    x = real(sum(M));
end

