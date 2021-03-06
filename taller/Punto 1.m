syms t; k=10;   % Variable sim�lica t, k=Cantidad de t�rminos de cada lado (positivos/negativos)

%Ejemplo hecho en clase

T=pi;   w0=2*pi/T;  % Par�metros de la funci�n original: Periodo y frecuencia fundamental.
f=pulso(t-T/2,T)*exp(-t/2); % Funci�n original
f0=repetir(f,3,T);  % Periodicidad
ezplot(f0,[0 3*T]); grid on; hold on;

n=-k:k;

D0=2*(1-exp(-pi/2))/pi; % T�rmino de corriente directa (DC)
Dn=D0*(1-4i*n)./(16*(n.^2)+1);  % Vector con los t�rminos de la serie con k t�rminos de cada lado
Dn(k+1)=D0; % Sustituyendo D0 en el vector de coeficientes

faprox=sum(Dn.*exp(1i*n*w0*t)); % Funci�n aproximada por la serie
ezplot(faprox,[0 3*T]); title('Funci�n original vs. aproximada'); hold off;