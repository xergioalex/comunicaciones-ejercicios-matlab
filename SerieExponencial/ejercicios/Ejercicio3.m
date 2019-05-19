syms t; k=10;   % Variable sim�lica t, k=Cantidad de t�rminos de cada lado (positivos/negativos)
%Ejemplo hecho en clase

T=4;   w0=2*pi/T;  % Par�metros de la funci�n original: Periodo y frecuencia fundamental.
f=pulso(t-0.5,1)-pulso(t-7/2,1);
f3=repetir(f,4,T);
ezplot(f3,0,2*T); title('f(t)'); grid on;

n=-k:k;

%D0=6/5; % T�rmino de corriente directa (DC)
%Dn=(1.+exp(-i*n*4*pi/5).*(1.-2*exp(-i*n*4*pi/5))).*((-i*n*2*pi)./(4*n.^2*pi^2));  % Vector con los t�rminos de la serie con k t�rminos de cada lado
%Dn(k+1)=D0; % Sustituyendo D0 en el vector de coeficientes

%faprox=sum(Dn.*exp(i*n*w0*t)); % Funci�n aproximada por la serie
%ezplot(faprox,[-2 3*T]); title('Funci�n original vs. aproximada'); hold off;

%espectro
%W=n*w0; % Dominio del gr�fico (frecuencias m�ltiplos de la fundamental)
%M=abs(Dn);   % Magnitud de cada coeficiente complejo
%F=angle(Dn);    % �ngulo (o argumento) de cada coeficiente complejo
%stem(W,M); hold on; title('Espectro de frecuencias (Magnitud y Fase)');
%stem(W,F,'rx'); hold off;