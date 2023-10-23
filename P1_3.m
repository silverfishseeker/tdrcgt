u = RepUtils;

% Amplitud
A=13;
% Frecuencia base
f0=50;
% Periodo
T=1/f0;

% Precisión de muestreo continua
tpress = 100;
% Frecuencia de muestreo
fs = 2000;
% Número de periodos a representar
nTs = 10;


%% 1. Señal senoidal %%
% Tiempo final
tmax=nTs*T;
% Calcular intervalo de muestreo de tiempo
fm = tpress * f0;
tm = 1/fm;
% Muestreo de tiempo
t=0:tm:tmax-tm;
% Funcion
x_t = A*sin(2*pi*f0*t);

u.graficar(t,x_t,1,"","", "");
hold on;


%% 2. Señal discreta %%
% Calculo de muestreo
ts = 1/fs;
n=(0:ts:tmax-ts);
% Funcion
x_n=A*sin(2*pi*f0*n);

hold on;
u.graficarBarras(n,x_n,1,"Onda senoidal","tiempo", "amplitud");
hold off;


%% 3. Análisis en frecuencia
% fft
X=fft(x_n);

% Total de muestras
Ln = length(X);
% Intervalo muestras
fstep = fs/Ln;
% Frecuencias
f = 0:fstep:fs-fstep;

% FT "matemática"
X = abs(X / Ln);
u.graficarBarras(f,X,2,"Transformada de Fourier(duplicada)","frecuencia", "amplitud");

% FT "física"
X = X(1:Ln/2+1);
X(2:end-1) = 2*X(2:end-1);
f = 0:fstep:fs/2;
u.graficarBarras(f,X,3,"Transformada de Fourier (real)","frecuencia", "amplitud");


%% 3. Analisis frecuencias mezcla
% Amplitud 2
A_2=8;
% Frecuencia base 2
f0_2=250;
% Segunda senoidal
x_n2 = A_2*sin(2*pi*f0_2*n);

% Señal suma
x_mix = x_n + x_n2;

figure(4);
subplot(3,1,1);
u.graficar(n,x_n, 4, "Senoidal f=50", "tiempo", "amplitud");

subplot(3,1,2);
u.graficar(n,x_n, 4, "Senoidal f=250", "tiempo", "amplitud");

subplot(3,1,3)
u.graficar(n,x_mix, 4, "Mezcla de funciones senoidales", "tiempo", "amplitud");

% Analisis de Fourier
[f, X_mix] = FuncUtils.FourierAnalis(x_mix,fs);
u.graficarBarras(f, X_mix, 5, "Analisis de Fourier de la mezcla", "frecuencia", "amplitud");

