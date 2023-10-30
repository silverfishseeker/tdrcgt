function [] = main()
    A = 1;
    f0 = 5000;
    tpress = 1000;

    %n = input('Tamaño de palabra: ');
    %msg = input('Código de bits: ', 's');
    n = 2;
    msg = '00011011';

    [t,x] = x_PSK_modulation(n, msg, A, f0, tpress);
    ru = RepUtils;
    ru.graficar(t,x,2,"Señal modulada en fase","tiempo","amplitud");
end
function [t,x] = sinFaseMod(A,f0,fase,t0,tpress)
    % intervalo de tiempo superior
    tmax=t0+1/f0;
    % Calcular intervalo de muestreo de tiempo
    fm = tpress * f0;
    tm = 1/fm;
    % Muestreo de tiempo
    t=t0:tm:tmax-tm;
    % Funcion
    x = A*sin(2*pi*f0*t+fase);
    ru = RepUtils;
    ru.graficar(t,x,1,"Señal modulada en fase"+fase,"tiempo","amplitud");
end

function [t, x] = x_PSK_modulation(n, msg, A, f0, tpress)
    if mod(strlength(msg),n) ~= 0
        error("El número de bits no es múltiplo de el tamaño de palabra.")
    end
    c = cellstr(reshape(msg, [], n));
    t=[];
    x=[];
    i = 0;
    T = 1/f0;

    for ci = c
        disp(ci);
        bin2dec(ci);
        fase = bin2dec(ci)*2*pi/(2^n);
        [ti, xi] = sinFaseMod(A,f0,fase,i*T,tpress);
        t=[t,ti];
        x=[x,xi];
        i=i+1;
    end
end
