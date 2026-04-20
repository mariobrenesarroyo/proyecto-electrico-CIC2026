##  Análisis de resultados: Semana 5. 

### Memoria de Cálculo: Ganancias de Prealimentación (Feedforward)

Para la implementación del control proactivo, se calcularon las ganancias de cada bloque Feedforward ($K_{ff}$) utilizando el principio de cancelación de perturbaciones en estado estacionario. La fórmula empleada para cada canal es:

$$K_{ff,i} = - \frac{K_{p,disturbio\_i}}{K_{p,planta}}$$

Considerando la ganancia de la planta identificada como **$K_{p,planta} = 4.2729$**, los cálculos resultantes son:

### 1. Entrada del Evaporador ($T_{e,evap}$)
* **$K_p$ disturbio:** 0.55115
* **Cálculo:** $K_{ff1} = - \frac{0.55115}{4.2729} \approx \mathbf{-0.1289}$

### 2. Torre de Refrigeración ($T_{e,torr,ref}$)
* **$K_p$ disturbio:** 0.10831
* **Cálculo:** $K_{ff2} = - \frac{0.10831}{4.2729} \approx \mathbf{-0.0253}$

### 3. Salida del Tanque ($T_{s,TES}$)
* **$K_p$ disturbio:** -0.025154
* **Cálculo:** $K_{ff3} = - \frac{-0.025154}{4.2729} \approx \mathbf{0.0058}$

### 4. Temperatura Ambiente ($T_{amb}$)
* **$K_p$ disturbio:** -0.032773
* **Cálculo:** $K_{ff4} = - \frac{-0.032773}{4.2729} \approx \mathbf{0.0076}$

---

##  6. Puntos de Operación (Bias)
![Diagrama-FF](../imagenes/problema/Resutados/Diagrama-PI-+-4-FF.png)


Para asegurar que el control actúe únicamente sobre las desviaciones dinámicas, se aplicó un "offset" o valor promedio a cada señal de entrada antes de la ganancia $K_{ff}$. Los valores promedio utilizados, basados en la caracterización del sistema, son:

| Variable | Descripción | Valor de Referencia (Bias) |
| :--- | :--- | :--- |
| $T_{e,evap}$ | Entrada Evaporador | 11.9239 °C |
| $T_{e,torr,ref}$ | Entrada Torre | 29.0249 °C |
| $T_{s,TES}$ | Salida Tanque | 89.4452 °C |
| $T_{amb}$ | Temp. Ambiente | 30.4455 °C |

**Nota de implementación:** En Simulink, cada entrada de perturbación se procesa como: 
$$\Delta u_{ff,i} = (T_{medida,i} - T_{promedio,i}) \cdot K_{ff,i}$$

### Optimización : Control Proactivo Total (4 Perturbaciones)

Como paso final, se incorporaron las perturbaciones de la temperatura del tanque ($T_{s,TES}$) y la temperatura ambiente ($T_{amb}$), completando un esquema de prealimentación de 4 canales.

| Configuración | R1 | R2 | **J Global** |
| :--- | :--- | :--- | :--- |
| PI + 2 FF | 0.8283 | 1.1087 | 0.8844 |
| **PI + 4 FF (Final)** | **0.8152** | **1.1125** | **0.8747** |

**Conclusión de la Fase 1:** El sistema final demuestra una robustez superior. La compensación del tanque y el ambiente, aunque de menor magnitud que las de entrada de agua, permitieron refinar el índice $J$ en un **1% adicional**, logrando un desempeño final **12.5% superior** al controlador de referencia.