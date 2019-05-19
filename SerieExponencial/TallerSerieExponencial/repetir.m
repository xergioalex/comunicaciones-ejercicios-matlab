function [ f ] = repetir( g, veces, T )
%REPETIR Repite una funcion simbolica en (t o x) tomando en cuenta las 
%variables veces y T (periodo)

if veces>0 
    n=0:veces-1;
    x=symvar(g,1)-n*T;
    f=sum(subs(g,symvar(g,1),x));
else
    error('La cantidad de veces no puede ser cero ni negativa: %d',veces)
end

end

