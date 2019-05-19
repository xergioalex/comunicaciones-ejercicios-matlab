Clase
syms t
ezplot(pulso(t-1,2),-3:3)
ezplot(pulso(t+1.5,1),-3:3)
ezplot(pulso(t+0.5,1)-pulso(t-0.5,1),-3:3)
ezplot((t+2)*pulso(t+1.5,1)+pulso(t,2)+(2-t)*pulso(t-1.5,1),-3:3)

grid on
hold

 A (2:2:end,1:2:end)
 A (end:-2:1,2:2:end)
 [f,c] =size(A);
 fi=1:2:f;
 fin=f:-1:1;
 A(fin,2:2:end)
 
 %Promedio movil
 y[n] = (x[n-1]+x[n]+x[n+1])/3
 
 
 Vp = c 
 