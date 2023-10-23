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
ru.graficar(w, Hmod, 3, "Filtro paso bajo", "radianes", " filtro")

%b)
ru.graficarLogX(w, Hmod, 4, "Filtro paso bajo", "radianes", "filtro");

%c)
Hdb = 20*log10(Hmod);
ru.graficar(w, Hdb, 5, "Filtro paso bajo", "radianes", " filtro")

%d)
ru.graficarLogX(w, Hdb, 6, "Filtro paso bajo", "radianes", "filtro");

%e)
figure(7);
subplot(2,1,1);
plot(w,Hdb);
ru.decorarGrafica(7,"Módulo en db", "radianes","filtro");

subplot(2,1,2);
plot(w,angle(H)/pi*180);
ru.decorarGrafica(7,"Argumento en grados sexagesimales", "radianes","filtro");


ru.graficarLogX(f, Hmod, 8, "Filtro paso bajo", "frecuencias", " filtro")

%% Hallar señal de salida

S = X .* Hmod;
ru.graficarBarras(f, S, 9, "Fourier de la filtrada", "frecuencia", "amplitud");
