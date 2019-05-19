function [ f ] = pulso( x, tau )
%PULSO generacion de un pulso unitario dependiente de x con duracion tau
%centrado en cero

f=heaviside(x+tau/2)-heaviside(x-tau/2);

end

