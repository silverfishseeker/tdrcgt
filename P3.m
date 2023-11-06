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
%n = 4; %Numero de bits

%% Apartado 1
% Calculo numero de fases para modulacion 8-psk
filas = 2^n;
fase = 0:2*pi/filas : 2*pi-2*pi/filas;

%Representacion todos los simbolos posibles
figure(1)
polarplot(fase(1),A,'*');
hold on
for i=2:length(fase)
    polarplot(fase(i),A,'*');
end
hold off

% Muestra una leyenda segun el numero de bits
if n==2
    title('Espacio de la señal de la modulación 4-PSK');
    legend('00','01', '10', '11');
end

if n==3
    title('Espacio de la señal de la modulación 8-PSK');
    legend('000','001','010','011','100','101','110','111');
end

if n==4
    title('Espacio de la señal de la modulación 16-PSK');
    legend('0000','0001','0010','0011','0100','0101','0110','0111','1000' ...
        ,'1001','1010','1011','1100','1101','1110','1111');
end


%% Apartado 2
% Se asigna la cadena a una matriz y se pasa de binario a decimal
B = bin2dec(reshape(cadena,n,[])');

%Se crea una matriz de filas variable segun los bits elegidos
M = zeros(length(B),length(t));

for i = 1:length(B)
    M(i,:) = A*cos(2*pi*f*t + fase(B(i)+1));
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
xlabel('Tiempo (s)');
ylabel('Amplitud');

