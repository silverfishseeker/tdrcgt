A = 1;
f = 5000;
T = 1/f;
fm = 200*f;
Tm = 1/fm;
t = 0:Tm:T-Tm;

%Toma de datos por input
cadena = input('Ingrese una cadena de 12 bits: ', 's');
n = input('Ingrese el numero de bits: ');

%cadena ='111010011010';
%n = 2; %Numero de bits

% Apartado 1
% Calculo numero de fases para modulacion 8-psk
fase8psk = 0:2*pi/8 : 2*pi-2*pi/8;

%Representacion todos los simbolos posibles
figure(1)
polarplot(fase8psk(1),A,'*');
hold on

for i=2:length(fase8psk)
    polarplot(fase8psk(i),A,'*');
end

hold off
title('Espacio de la señal de la modulación 8-PSK');
legend('000','001','010','011','100','101','110','111');

%Apartado 2
filas = 2^n;
fase = 0:2*pi/filas : 2*pi-2*pi/filas;

% Se asigna la cadena a una matriz y se pasa de binario a decimal
%Matriz = reshape(cadena,n,[])';
B = bin2dec(reshape(cadena,n,[])');

%Se crea una matriz de filas variable segun los bits elegidos
M = zeros(length(B),length(t));
numFase = zeros(1,length(B));

for i = 1:length(B)
    numFase(i) = fase(B(i)+1);
    M(i,:) = A*cos(2*pi*f*t + numFase(i));
end

%Se transforma la matriz anterior en un vector
MatrizCompleta = reshape(M.',1,[]);

%Nuevo tiempo adaptado al tamaño del vector anterior
Tmax = length(B) * T;
t2 = 0:Tm:Tmax-Tm;

figure(2)
plot(t2,MatrizCompleta)
title('Representacion cadena de datos: ');
grid on;
xlabel('Tiempo');
ylabel('Amplitud');

