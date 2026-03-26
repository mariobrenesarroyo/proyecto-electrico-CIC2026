% 1. Definir el nombre del archivo de salida para tu experimento
nombre_archivo = 'Datos_Paso_Operacion_CIC2026.mat';

% 2. Capturar el recorrido completo de la referencia (Vector 7201x1)
% Se guarda para poder comparar el error (IAE) en lazo abierto luego
Ref_Recorrido = Ts_Evap_ref; 

% 3. Calcular los valores promedio (Valores DC para superposición)
prom_Ts_TES      = mean(Ts_TES);
prom_Te_Evap     = mean(Te_Evap);
prom_Te_Torr_ref = mean(Te_Torr_ref);
prom_T_amb       = mean(T_amb);

% 4. Imprimir resultados en la terminal para tu bitácora
fprintf('\n================================================\n');
fprintf('   VALORES PROMEDIO (PUNTO DE OPERACIÓN)        \n');
fprintf('================================================\n');
fprintf('Ts_TES promedio:       %.4f °C\n', prom_Ts_TES);
fprintf('Te_Evap promedio:      %.4f °C\n', prom_Te_Evap);
fprintf('Te_Torr_ref promedio:  %.4f °C\n', prom_Te_Torr_ref);
fprintf('T_amb promedio:        %.4f °C\n', prom_T_amb);
fprintf('================================================\n\n');

% 5. Guardar los datos necesarios para el nuevo Simulink
% Guardamos t para que el bloque "From Workspace" no de error de tiempo
save(nombre_archivo, 'Ref_Recorrido', 'prom_Ts_TES', 'prom_Te_Evap', ...
     'prom_Te_Torr_ref', 'prom_T_amb', 't');

fprintf('Archivo "%s" generado correctamente.\n', nombre_archivo);