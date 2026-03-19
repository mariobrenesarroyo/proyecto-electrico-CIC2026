%% SCRIPT DE IDENTIFICACIÓN Y SINTONÍA ANALÍTICA - CIC 2026
% 1. Configuración de datos
Ts = t(2) - t(1); % Tiempo de muestreo
entrada = alpha_ref; 
salida = Ts_Evap;

% Creamos el objeto de datos para identificación
% 'detrend' elimina el valor medio para enfocarse en la dinámica de cambio
data = iddata(salida, entrada, Ts);

% 2. Identificación del Modelo (FOPDT: Primer Orden + Tiempo Muerto)
% np = 1 (un polo), nz = 0 (cero ceros), iodelay = NaN (que MATLAB lo estime)
fprintf('Estimando modelo de la planta... por favor espera.\n');
modelo_planta = tfest(data, 1, 0, NaN); 

% 3. Extracción de Parámetros de la Teoría de Control
K_p = dcgain(modelo_planta); % Ganancia estática
[num, den] = tfdata(modelo_planta, 'v');
tau_p = den(1) / den(2);      % Constante de tiempo (segundos)
L_p = modelo_planta.IODelay;  % Retardo puro (segundos)

fprintf('\n--- RESULTADOS DEL MODELO IDENTIFICADO ---\n');
fprintf('Ganancia (K): %.4f\n', K_p);
fprintf('Constante de tiempo (tau): %.2f s\n', tau_p);
fprintf('Retardo (L): %.2f s\n', L_p);

% 4. Cálculo de Sintonía Analítica (Método IMC)
% Lambda es el parámetro de sintonía: 
% Más pequeño = más rápido (R1 bajo), más grande = más suave (R2 bajo).
lambda = 0.5 * L_p; 

Kp_calc = (1/K_p) * (tau_p / (L_p + lambda));
Ki_calc = Kp_calc / tau_p;

fprintf('\n--- NUEVOS PARÁMETROS PARA TU BLOQUE PI ---\n');
fprintf('Numerador del bloque Transfer Fcn: [%.6f, %.6f]\n', Kp_calc, Ki_calc);
fprintf('Denominador del bloque Transfer Fcn: [1, 0]\n');
fprintf('------------------------------------------\n');