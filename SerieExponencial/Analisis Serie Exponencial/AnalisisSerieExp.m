%% An�lisis de la Serie Exponencial de Fourier
% La serie exponencial da pi� a una serie de relaciones importantes en el
% �rea de las comunicaciones, en particular el teorema de Parseval.
% Trabajarlo en Matlab nos permite observar la convergencia de la serie y
% comparar la calidad de la aproximaci�n usando el T. de Parseval.

% Inicializaci�n del gui�n (script)
syms t; k=10;   % Cantidad de t�rminos de cada lado (positivos/negativos)

%% Ejemplo hecho en clase

T=pi;   w0=2*pi/T;  % Par�metros de la funci�n original
f=pulso(t-T/2,T)*exp(-t/2); % Funci�n original

% Potencia de la se�al
pf=(1/T)*int(f^2,0,T);

f0=repetir(f,3,T);  % Simular la periodicidad de la se�al
ezplot(f0,[0 3*T]); grid on; hold on;

n=-k:k;

D0=2*(1-exp(-pi/2))/pi; % T�rmino de corriente directa (DC)
Dn=D0*(1-4i*n)./(16*(n.^2)+1);  % Vector con los t�rminos de la serie con k t�rminos de cada lado
Dn(k+1)=D0; % Sustituyendo D0 en el vector de coeficientes

% T. de Parseval (Potencia de la aproximaci�n)
ps=double(sum(abs(Dn).^2))
double(pf)
double(ps/pf)   % Calidad de la aproximaci�n (porcentaje de energ�a de la funci�n original)

% Reconstrucci�n mediante coeficientes complejos
faprox=sum(Dn.*exp(1i*n*w0*t)); % Funci�n aproximada por la serie
ezplot(faprox,[0 3*T]); title('Funci�n original vs. aproximada'); hold off;
%display(faprox);
%% Ejemplo de espectro 
% Cada coeficiente est� asociado con una frecuencia m�ltiplo de la frec.
% fundamental w0. El espectro de frecuencia es otra forma de representar
% una funci�n pero no en el dominio del tiempo (t) sino en el dominio de la
% frecuencia (w). Cada frecuencia m�ltiplo de la fundamental es llamada
% arm�nica.

W=n*w0; % Dominio del gr�fico (frecuencias m�ltiplos de la fundamental)

M=abs(Dn);   % Magnitud de cada coeficiente complejo
F=angle(Dn);    % �ngulo (o argumento) de cada coeficiente complejo

stem(W,M); hold on; title('Espectro de frecuencias (Magnitud y Fase)');
stem(W,F,'rx'); grid on; hold off;

%% Reconstrucci�n con base en el espectro

% Reconstrucci�n mediante magnitud y fase
faprox=sum(M.*exp(1i*n*w0*t+1i*F)); % Cada magnitud por la exponencial compleja 
ezplot(faprox,[0 3*T]); grid on;
