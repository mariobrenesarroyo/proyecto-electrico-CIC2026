## Sesión 5.1
* **Fecha:** 20 de abril, 2026
* **Tipo de sesión:** Optimización Final y Validación de Índices
* **Actividades:** * Se completó el esquema de **Control Proactivo Total** mediante la integración de las 4 señales de perturbación principales ($T_{e,evap}$, $T_{e,torr,ref}$, $T_{s,TES}$ y $T_{amb}$).
    * Se recalcularon las ganancias de prealimentación ($K_{ff}$) utilizando los modelos de perturbación identificados por respuesta escalón, destacando el ajuste de la ganancia para la temperatura ambiente ($K_{p,amb} = -0.032773$) y la salida del tanque ($K_{p,tes} = -0.025154$).
    * Se parametrizaron los bloques de "Bias" en Simulink con los valores promedio exactos de operación: $T_{s,TES}$ (89.44 °C), $T_{e,evap}$ (11.92 °C), $T_{e,torr,ref}$ (29.02 °C) y $T_{amb}$ (30.44 °C).
    * Se ejecutó la validación final con el script `CalculoIndices_Categoria1`, obteniendo un nuevo récord de desempeño: **J = 0.8747** (R1 = 0.8152, R2 = 1.1125).
* **Trabajo Futuro:** Finalizar la redacción del reporte técnico `semana-05.md` y realizar una prueba de sensibilidad ante variaciones de los parámetros de la planta (robustez).
* **Horas invertidas:** 4 horas

## Sesión 5.2
* **Fecha:** 23 de abril, 2026
* **Tipo de sesión:** Reunión
* **Actividades:** * Se habló un poco acerca de como optimizar de una mejor manera el controlador PI y ademas se dieron retroalimentaciones sobre como mejorar la documentación del proyeco
* **Trabajo Futuro:** Aplicar las mejoras al controlador y mejorar la documentación
* **Horas invertidas:** 1 hora

## Sesión 5.3
* **Fecha:** 24 de abril, 2026
* **Tipo de sesión:** Optimización de Estructura de Control
* **Actividades:** * Se reemplazó el bloque `Transfer Fcn` por un bloque `PID Controller` nativo de Simulink en configuración **Ideal**.
    * Se configuró el **Anti-windup** mediante el método de **Clamping** y se limitó la salida del controlador entre 0 y 1 para representar las restricciones físicas del actuador.
    * Se ajustó el parámetro integral como $I = 1/T_i$ ($1/41.932$) para mantener la consistencia con la sintonía Lambda.
    * Se validó el desempeño final obteniendo un índice **J = 0.8177**, el valor más bajo registrado hasta la fecha.
* **Trabajo Futuro:** Verificar el comportamiento del sistema ante ruido en los sensores y preparar la entrega final.
* **Horas invertidas:** 4 horas

---
!!! success "Datos Obtenidos"
    Las gráficas detalladas y el análisis del desempeño se pueden consultar en el [Análisis de la Semana 5](../analisis/semana-05.md).