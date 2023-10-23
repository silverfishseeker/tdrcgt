classdef FuncUtils
    methods(Static)
        function [f, X] = FourierAnalis(x, fmax)
            X=fft(x);
            l = length(X);
            X = abs(X / l);
            X = X(1:l/2+1);
            X(2:end-1) = 2*X(2:end-1);
            f = 0:fmax/l:fmax/2;
        end
    end
end

