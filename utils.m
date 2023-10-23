classdef utils
   methods
       function obj = utils
           clf;
       end
       function [] = complexRepresentation(self, x,y)
            % Muestra una representación gráfica sencilla de una función
            % compleja monstrando parte real, imaginaria, módulo y
            % argumento
        
            subplot(2,2,1)
            self.graficar(x, real(y), "Parte real");
            
            subplot(2,2,2)
            self.graficar(x, imag(y), "Parte imaginaria");
            
            subplot(2,2,3)
            self.graficar(x, abs(y), "Módulo");
            
            subplot(2,2,4)
            self.graficar(x, angle(y)/pi*180, "Argumento");
        end
        
        function[] = graficar(self, x, y, figura, titulo, xTag, yTag)
            % Grafica continua
            self.decorarGrafica(figura, titulo, xTag, yTag);
            plot(x,y);
        end
        
        function[] = graficarBarras(self, x, y, figura, titulo, xTag, yTag)
            % Grafica de barras
            self.decorarGrafica(figura, titulo, xTag, yTag);
            stem(x,y);
        end
        
        
        function[] = decorarGrafica(~, figura, titulo, xTag, yTag)
            figure(figura);
            title(titulo);
            grid on;
            xlabel(xTag);
            ylabel(yTag);
        end
   end
end