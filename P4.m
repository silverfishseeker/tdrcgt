ru = RepUtils;

%% 1. Creación de las señal moduladora, portadora y modulada
fm = 27; % Frecuencia de moduladora
Am = 18; % Amplitud moduladora
fp = 540; % Frecuencia portadora
Ap = 20; % Amplitud portadora
fs= 44100; % Frecuencia de muestreo
tmax=5; % Tiempo de muestra

tm = 1/fs;
t=0:tm:tmax-tm;

m = Am*sin(2*pi*fm*t);
p = Ap*sin(2*pi*fp*t);
x = (Ap+m).*sin(2*pi*fp*t);


%% 2. Representación en el dominio del tiempo
figure(1);
subplot(3,1,1);
ru.graficar(t,m,1,"Señal moduladora","tiempo","amplitud");
subplot(3,1,2);
ru.graficar(t,p,1,"Señal portadora","tiempo","amplitud");
subplot(3,1,3);
ru.graficar(t,x,1,"Señal modulada","tiempo","amplitud");

ru.graficar(t,x,2,"","","");
hold on;
env = m+Ap;
ru.graficar(t,env,2,"Señal modulada con envolvente","tiempo","amplitud");
hold off;

%% 3. Representación en el dominio de la frecuencia
fmax = 800;
[Fm, M] = FuncUtils.FourierAnalis(m, fs);
[Fp, P] = FuncUtils.FourierAnalis(p, fs);
[Fx, X] = FuncUtils.FourierAnalis(x, fs);

figure(3);

subplot(3,1,1);
ru.graficar(Fm, M,3,"Señal moduladora","frecuencia","amplitud");
xlim([0 800]);

subplot(3,1,2);
ru.graficar(Fp, P,3,"Señal portadora","frecuencia","amplitud");
xlim([0 800]);

subplot(3,1,3);
ru.graficar(Fx, X,3,"Señal modulada","frecuencia","amplitud");
xlim([0 800]);


%% 4. Potencia en el dominio de la frecuencia
pp = sum(P.^2);
disp(['Potencia media portadora: ' num2str(pp)]);
px = sum(X.^2);
disp(['Potencia media modulada:  ' num2str(px)]);


%% Modulación de amplitud con doble banda lateral (DBL)
%% 1.
xdbl= m.*p;

%% 2.
figure(4);
subplot(3,1,1);
ru.graficar(t,m,4,"Señal moduladora","tiempo","amplitud");
subplot(3,1,2);
ru.graficar(t,p,4,"Señal portadora","tiempo","amplitud");
subplot(3,1,3);
ru.graficar(t,xdbl,4,"Señal modulada en DBL","tiempo","amplitud");


figure(5);
ru.graficar(t,xdbl,5,"Señal modulada en DBL","tiempo","amplitud");
hold on;
ru.graficar(t,m*Ap,5,"Señal moduladora","tiempo","amplitud");
ru.graficar(t,-m*Ap,5,"Señal moduladora","tiempo","amplitud");
hold off;

%% 3.
[Fxdbl, Xdbl] = FuncUtils.FourierAnalis(xdbl, fs);

figure(6);

subplot(3,1,1);
ru.graficar(Fm, M,6,"Señal moduladora","frecuencia","amplitud");
xlim([0 800]);

subplot(3,1,2);
ru.graficar(Fp, P,6,"Señal portadora","frecuencia","amplitud");
xlim([0 800]);

subplot(3,1,3);
ru.graficar(Fxdbl, Xdbl,6,"Señal modulada en DBL","frecuencia","amplitud");
xlim([0 800]);

%% 4.
pxdbl = sum(Xdbl.^2);
disp(['Potencia media modulada en DBL:  ' num2str(pxdbl)]);
