function [ f ] = pulso( x,tau )
if tau >0
    f=heaviside(x+tau/2)-heaviside(x-tau/2);
else
    disp('error');
end

