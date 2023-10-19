A=13;
%tau=T/5;
f0=50;
T=1/f0;

%Señal continua
fm=100*f0;
Tm=1/fm;
Tmax = 10*T;
t=0:Tm:Tmax-Tm;
x_t=A*sin(2*pi*f0*t);

%Señal discreta
fs=2000;
Ts=1/fs;
tmax = 10*T;
n=(0:Ts:tmax-Ts);
x_n=A*sin(2*pi*f0*n);

figure(1)
plot(t,x_t);
hold on
stem(n,x_n);


Y=fft(x_n);
Ln=length(Y);
P2=abs(Y/Ln);
EjeF=(0:fs/Ln:fs-fs/Ln);

%figure(2)
%stem(EjeF,P2)

P1=P2(1:Ln/2+1);
P1(2:end-1)=2*P1(2:end-1);
EjeF=(0:fs/Ln:fs/2);

figure(2)
plot(EjeF,P1)

%Creacion x_n2
A2= 8;
f2= 250;
x_n2 = A2*sin(2*pi*f2*n);

x_mix = x_n + x_n2;

figure(3)
subplot(3,1,1)
plot(n,x_n)

subplot(3,1,2)
plot(n,x_n2)

subplot(3,1,3)
plot(n,x_mix)

Z=fft(x_mix);
Ln=length(Z);
P2=abs(Z/Ln);
EjeF=(0:fs/Ln:fs-fs/Ln);

P1=P2(1:Ln/2+1);
P1(2:end-1)=2*P1(2:end-1);
EjeF=(0:fs/Ln:fs/2);

figure(4)
plot(EjeF,P1)


