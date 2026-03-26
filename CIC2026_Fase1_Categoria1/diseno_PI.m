% 1. Definir la planta (G11 de tu identificación)
s = tf('s');
G = (-0.0361 / (1 + 2.62*s)) * exp(-2.84*s); 

% 2. Definir tu controlador PI actual
C = (-27.77*s - 4.05) / s;

% 3. Abrir la herramienta de diseño
controlSystemDesigner(G, C)