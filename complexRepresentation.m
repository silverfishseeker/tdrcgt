function [] = complexRepresentation(x,y)
    %COMPLEXREPRESENTATION Summary of this function goes here
    %   Detailed explanation goes here

    subplot(2,2,1)
    graficar(x, real(y), "Parte real");
    
    subplot(2,2,2)
    graficar(x, imag(y), "Parte imaginaria");
    
    subplot(2,2,3)
    graficar(x, abs(y), "Módulo");
    
    subplot(2,2,4)
    graficar(x, angle(y)/pi*180, "Argumento");
end

function[] = graficar(x, y, titulo)
    plot(x,y);
    title(titulo);
end