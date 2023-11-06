function [] = main()
A = 1;
fm = 1000000;
f0 = 5000;
T= 
tpress = 1000;

%n = input('Tamaño de palabra: ');
%msg = input('Código de bits: ', 's');
n = 2;
msg = '00011011';


tamCod = 2^n;
fases = 0:2*pi/tamCod : 2*pi-2*pi/tamCod;

figure(1)
hold on
polarplot(fases(1),A,'*');
for i=2:length(fases)
    polarplot(fases(i),A,'*');
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


% Se asigna la cadena a una matriz y se pasa de binario a decimal
B = bin2dec(reshape(msg, [], n)');

Tm = 1/fm;
t = 0:Tm:T-Tm;

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
