load('Datos_PI_Lambda.mat');   Datos_PI_lambda = data;
load('Datos_PID_ZN.mat');      Datos_PID_ZN = data;
load('Datos_PID_IMC.mat');     Datos_PID_IMC = data;

figure('Color', 'w');
plot(Datos_PI_lambda.Time, Datos_PI_lambda.Data, 'b', 'LineWidth', 1); hold on;
plot(Datos_PID_ZN.Time, Datos_PID_ZN.Data, 'r', 'LineWidth', 1);
plot(Datos_PID_IMC.Time, Datos_PID_IMC.Data, 'g', 'LineWidth', 2.5);

xlabel('Tiempo (s)', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Temperatura (T_{s\_Gen})', 'FontSize', 12, 'FontWeight', 'bold');
title('Comparativa de Controladores: Respuesta a Perturbaciones', 'FontSize', 14);
legend('PI (\lambda=18)', 'Ziegler-Nichols', 'PID-IMC+4FF (Propuesto)', ...
       'Location', 'best', 'FontSize', 18);
grid on;
