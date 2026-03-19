% 1. Preparar la matriz de datos (incluimos la salida al final para la matriz)
datos = [alpha_ref, T_amb, Ts_TES, Te_Evap, Te_Gen, Ts_Evap];
nombres = {'alpha_ref', 'T_amb', 'Ts_TES', 'Te_Evap', 'Te_Gen', 'Ts_Evap'};

% 2. Calcular la matriz de correlación (Base MATLAB)
% R será una matriz donde la última fila/columna es la correlación con Ts_Evap
R = corrcoef(datos);

% 3. Extraer solo la correlación de las entradas con la salida (Ts_Evap)
% La última columna (excluyendo el último valor que es 1)
correlaciones_salida = R(1:end-1, end);

% 4. Visualizar resultados
figure;
h = bar(correlaciones_salida);
set(gca, 'XTick', 1:length(nombres)-1, 'XTickLabel', nombres(1:end-1));
xtickangle(45);
ylabel('Coeficiente de Correlación (R)');
title('Impacto de las Variables en Ts\_Evap');
grid on;

% 5. Mostrar en consola para tu análisis
fprintf('--- Impacto sobre Ts_Evap (Categoría 1) ---\n');
for i = 1:length(correlaciones_salida)
    fprintf('%s: %.4f\n', nombres{i}, correlaciones_salida(i));
end
