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

cn = A*tau/T*sinc(n/T*tau);
u.graficarBarras(n, cn, 1, "Coeficientes Cn", "n", "valor");

%% b) Representar 10 peridos de x
M = zeros(length(n), length(t));
for i = 1:length(n)
    c = A*tau/T*sinc(n(i)/T*tau);
    e = exp(1j*n(i)*2*pi/T*t);
    M(i,:)= c *e ;
end
x = real(sum(M));
u.graficar(t, x, 2, "Función x(t)", "tiempo", "amplitud");


%% c) Potencia media por frecuencia
pm_f = sum(abs(cn).^2);
disp(['Potencia media por los coeficientes: ' num2str(pm_f)]);

%% d) Potencia media por tiempo
pm_t = sum(x.^2)/(length(t));
disp(['Potencia media por tiempo: ' num2str(pm_t)]);
