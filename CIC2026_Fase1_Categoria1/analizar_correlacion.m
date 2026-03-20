% 1. Definir la matriz de todas las variables posibles
% Asegúrate de que todos los vectores tengan la misma longitud
nombres = {'alpha_ref', 'Ts_Gen', 'T_amb', 'Te_Evap', 'Ts_TES', 'Te_Torr_ref', 'Ts_Evap'};
datos_completos = [alpha_ref, Ts_Gen, T_amb, Te_Evap, Ts_TES, Te_Torr_ref, Ts_Evap];

% 2. Calcular matriz de correlación
R_matrix = corrcoef(datos_completos);

% 3. Extraer solo la última columna (impacto sobre Ts_Evap)
impacto = R_matrix(1:end-1, end);

% 3.1 Imprimir en terminar la correlacion
% Mostrar en la terminal la correlación de cada variable con Ts_Evap
fprintf('Correlación de cada variable con Ts_Evap:\n');
for i = 1:length(impacto)
    fprintf('  %s : %+.4f\n', nombres{i}, impacto(i));
end

% 4. Graficar para tu reporte de proyecto
figure('Name', 'Justificación de Variables - CIC2026');
b = bar(impacto, 'FaceColor', [0 0.4470 0.7410]);
set(gca, 'XTick', 1:length(nombres)-1, 'XTickLabel', nombres(1:end-1));
xtickangle(45);
ylabel('Coeficiente de Correlación (R)');
title('Impacto de Variables sobre la Temperatura de Salida (Ts\_Evap)');
grid on;

% Añadir etiquetas de valor sobre las barras
text(1:length(impacto), impacto, num2str(impacto, '%0.2f'), ...
    'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center');