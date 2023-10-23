ru = RepUtils;

f1 = 801;
f2 = 3313;
A = 10;
fs = 100000;
tmax = 10;
fmax = 2*fs;

%% 1. Creación de una señal muestreada
ts = 1/fs;
n = 0:ts:tmax-ts;
x = A*sin(2*pi*f1*n) + A*sin(2*pi*f2*n);

%% 2. Análisis en frecuencia
[f, X] = FuncUtils.FourierAnalis(x, fs);
ru.graficarBarras(f, X, 2, "Fourier", "frecuencia", "amplitud");

%% 3. Representar la función de transferencia de un filtro
f1 = 1000;
f2 = 2000;

w = 2*pi*f;
s = 1j*w;
w1 = 2*pi*f1;
w2 = 2*pi*f2;
H = 1 ./ (1 + sqrt(2)*(s/w1) + (s/w2).^2);
Hmod = abs(H);

%a)
ru.graficar(w, Hmod, 3, "Filtro paso bajo", "radianes", "modulo")

%b)
ru.graficarLogX(w, Hmod, 4, "Filtro paso bajo", "radianes", "modulo");

%c)
Hdb = 20*log10(Hmod);
ru.graficar(w, Hdb, 5, "Filtro paso bajo", "radianes", "modulo db")

%d)
ru.graficarLogX(w, Hdb, 6, "Filtro paso bajo", "radianes", "modulo db");

%e)
figure(7);
subplot(2,1,1);
semilogx(w,Hdb);
ru.decorarGrafica(7,"Módulo en db", "radianes","filtro");

subplot(2,1,2);
semilogx(w,angle(H)/pi*180);
ru.decorarGrafica(7,"Argumento en grados sexagesimales", "radianes","argumento");


ru.graficarLogX(f, Hmod, 8, "Filtro paso bajo", "frecuencias", "módulo")
ru.graficarLogX(f, Hdb, 9, "Filtro paso bajo ", "frecuencias", "módulo db")
% 0.7
% -3db
% f_corte = 821.5;
% filtro paso bajo

%% 4. Hallar señal de salida

S = X .* Hmod;
ru.graficarBarras(f, S, 10, "Fourier de la filtrada", "frecuencia", "amplitud");
