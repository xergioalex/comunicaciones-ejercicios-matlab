function [ f ] = pulso1( t,d )
if d >0
    f=heaviside(t+d/2)-heaviside(t-d/2);
else
    disp('error');
end


