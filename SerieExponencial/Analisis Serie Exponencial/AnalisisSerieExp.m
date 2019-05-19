%% Análisis de la Serie Exponencial de Fourier
% La serie exponencial da pié a una serie de relaciones importantes en el
% área de las comunicaciones, en particular el teorema de Parseval.
% Trabajarlo en Matlab nos permite observar la convergencia de la serie y
% comparar la calidad de la aproximación usando el T. de Parseval.

% Inicialización del guión (script)
syms t; k=10;   % Cantidad de términos de cada lado (positivos/negativos)

%% Ejemplo hecho en clase

T=pi;   w0=2*pi/T;  % Parámetros de la función original
f=pulso(t-T/2,T)*exp(-t/2); % Función original

% Potencia de la señal
pf=(1/T)*int(f^2,0,T);

f0=repetir(f,3,T);  % Simular la periodicidad de la señal
ezplot(f0,[0 3*T]); grid on; hold on;

n=-k:k;

D0=2*(1-exp(-pi/2))/pi; % Término de corriente directa (DC)
Dn=D0*(1-4i*n)./(16*(n.^2)+1);  % Vector con los términos de la serie con k términos de cada lado
Dn(k+1)=D0; % Sustituyendo D0 en el vector de coeficientes

% T. de Parseval (Potencia de la aproximación)
ps=double(sum(abs(Dn).^2))
double(pf)
double(ps/pf)   % Calidad de la aproximación (porcentaje de energía de la función original)

% Reconstrucción mediante coeficientes complejos
faprox=sum(Dn.*exp(1i*n*w0*t)); % Función aproximada por la serie
ezplot(faprox,[0 3*T]); title('Función original vs. aproximada'); hold off;
%display(faprox);
%% Ejemplo de espectro 
% Cada coeficiente está asociado con una frecuencia múltiplo de la frec.
% fundamental w0. El espectro de frecuencia es otra forma de representar
% una función pero no en el dominio del tiempo (t) sino en el dominio de la
% frecuencia (w). Cada frecuencia múltiplo de la fundamental es llamada
% armónica.

W=n*w0; % Dominio del gráfico (frecuencias múltiplos de la fundamental)

M=abs(Dn);   % Magnitud de cada coeficiente complejo
F=angle(Dn);    % Ángulo (o argumento) de cada coeficiente complejo

stem(W,M); hold on; title('Espectro de frecuencias (Magnitud y Fase)');
stem(W,F,'rx'); grid on; hold off;

%% Reconstrucción con base en el espectro

% Reconstrucción mediante magnitud y fase
faprox=sum(M.*exp(1i*n*w0*t+1i*F)); % Cada magnitud por la exponencial compleja 
ezplot(faprox,[0 3*T]); grid on;
