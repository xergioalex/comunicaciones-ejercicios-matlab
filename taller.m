%% Taller de Matlab
% punto #1
    %ezplot((t+2)*pulso(t+1.5,1)+pulso(t,2)+(2-t)*pulso(t-1.5,1),-3:3); xlabel('a');
%% Utilizando pulsos para definir funciones
% Definir func a trozos
    %ezplot(cos(2*pi*t)^2)
    n =1:50
    %stem(cos(2*pi*n))
    stem(cos(2*n))