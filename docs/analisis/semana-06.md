##  Análisis de resultados: Semana 6 del 27 de abril al 3 de mayo.

### 🔹 Sección del 20 de abril


## Comparación de metodos de sintonización
# Valores de la planta
$K_p = 4.2729$


$\tau = 41.932\,s$
 
$L = 7.503\,s$

#### Método 1 Lambda (Controlador PI + 4FF)
De las semanas anteriores se puso el controlador PI del metodo lambda con implementación Feed-forward

donde los valores del controlador PI con $\lambda = 18\$ se derivaron como 

| Parámetro | Valor |
|-----------|-------|
| $Kc$ | 0.217 |
| $I = 1/Ts$ | $1/41.93 = 0.02385$ |

**Salida del controlador PI**  
![PI_clamping](../imagenes/problema/semana-5/salida%20de%20controlador%20PI_clamping.png)

Donde los índices de los valores  fueron:
| Índice | Valor |
|--------|-------|
| IAE | 473.5945 |
| TV | 6.1819 |
| R1 | 0.7425 |
| R2 | 1.1188 |
| J | 0.8177 |

Con esto vamos a comparar otros métodos de sintonización, implementando controladores **PID** para el análisis comparativo

#### Método 2 Ziegler-Nichols (controlador PID)

El método de Ziegler-Nichols proporciona ecuaciones empíricas para calcular los parámetros del controlador PID basándose en la respuesta del sistema. Existen dos métodos principales:

Si el sistema responde con una curva en forma de S ante un cambio escalón unitario, se puede aproximar a un modelo de primer orden con tiempo muerto:

$$G(s) = \frac{K e^{-\theta s}}{\tau s + 1}$$

| Parámetro | Ecuación |
|-----------|----------|
| $K_p$ | $1.2 \frac{\tau}{\theta}$ |
| $T_i$ | $2\theta$ |
| $T_d$ | $0.5\theta$ |


**Aplicación con valores de la planta**

Con los valores de la planta obtenidos:
- $K = 4.2729$
- $\tau = 41.932\,s$
- $\theta = L = 7.503\,s$

| Parámetro | Fórmula | Cálculo | Valor |
|-----------|---------|---------|-------|
| $K_p$ | $1.2 \frac{\tau}{\theta}$ | $1.2 \cdot \frac{41.932}{7.503}$ | $1.570$ |
| $T_i$ | $2\theta$ | $2 \cdot 7.503$ | $15.006\,s$ |
| $T_d$ | $0.5\theta$ | $0.5 \cdot 7.503$ | $3.751\,s$ |

Estos valores se implementarán en el controlador PID para comparar su desempeño con el método Lambda.

**Salida del controlador PID - Ziegler-Nichols**  
![PID_ZN](../imagenes/problema/semana%206/salida%20PID%20ZN.png)

Donde los índices obtenidos fueron:

| Índice | Valor |
|--------|-------|
| IAE | 294.2961 |
| TV | 20.4723 |
| R1 | 0.4614 |
| R2 | 3.7052 |
| J | 1.1101 |


#### Metodo 3 IMC (PID )

El método IMC (Internal Model Control) PID estándar utiliza las siguientes fórmulas basadas en el modelo de la planta:

$$G(s) = \frac{K e^{-\theta s}}{\tau s + 1}$$

| Parámetro | Ecuación| Valor |
|-----------|------------------------------|-------|
| Ganancia Proporcional ($K_c$) | $$K_c = \frac{1}{K} \cdot \frac{\tau + \frac{\theta}{2}}{\lambda + \frac{\theta}{2}}$$ | 0.4915 |
| Tiempo Integral ($T_i$) | $$T_i = \tau + \frac{\theta}{2}$$ | 45.683 s |
| Tiempo Derivativo ($T_d$) | $$T_d = \frac{\tau \cdot \theta}{2\tau + \theta}$$ | 3.443 s |

Donde $\lambda$ es el parámetro de diseño que define la velocidad de respuesta deseada del sistema en lazo cerrado.

**Salida del controlador PID - IMC**  
![PID_IMC](../imagenes/problema/semana%206/Salida%20PID%20IMC%20.png)

Donde los índices obtenidos fueron:

| Índice | Valor |
|--------|-------|
| IAE | 427.1595 |
| TV | 7.1028 |
| R1 | 0.6697 |
| R2 | 1.2855 |
| J | 0.7928 |

##### IMC con $K = 0.5152$ y $\lambda = 17$


Donde los índices obtenidos fueron:

| Índice | Valor |
|--------|-------|
| IAE | 416.3483 |
| TV | 7.1917 |
| R1 | 0.6527 |
| R2 | 1.3016 |
| J | 0.7825 |

##### IMC con $\lambda = 16$ y $K = 0.5413$

Donde los índices obtenidos fueron:

| Índice | Valor |
|--------|-------|
| IAE | 405.1565 |
| TV | 7.2598 |
| R1 | 0.6352 |
| R2 | 1.3139 |
| J | 0.7709 |

##### IMC con $\lambda = 9$

| Índice | Valor |
|--------|-------|
| IAE | 334.9447 |
| TV | 8.4652 |
| R1 | 0.5251 |
| R2 | 1.5321 |
| J | 0.7265 |

##### IMC con $\lambda = 8$

| Índice | Valor |
|--------|-------|
| IAE | 326.3420 |
| TV | 8.8270 |
| R1 | 0.5116 |
| R2 | 1.5976 |
| J | 0.7288 |

---

###  Comparativa Final de Desempeño y Sintonía

En la siguiente tabla se resumen los resultados obtenidos tras el barrido paramétrico y la comparación de metodologías. Se destaca cómo la variación de $\lambda$ en el método IMC permite encontrar el punto óptimo de operación entre precisión y suavidad.

| Método de Sintonización | Configuración | IAE | TV | R1 | R2 | **J (Global)** |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Lambda (Semana 5)** | PI ($\lambda = 18$) | 473.59 | 6.18 | 0.7425 | 1.1188 | 0.8177 |
| **Ziegler-Nichols** | PID | 294.29 | 20.47 | 0.4614 | 3.7052 | 1.1101 |
| **IMC** | PID ($\lambda = 30$) | 427.15 | 7.10 | 0.6697 | 1.2855 | 0.7928 |
| **IMC** | PID ($\lambda = 16$) | 405.15 | 7.25 | 0.6352 | 1.3139 | 0.7709 |
| **IMC (Óptimo)** | **PID ($\lambda = 9$)** | **334.94** | **8.46** | **0.5251** | **1.5321** | **0.7265** |
| **IMC** | PID ($\lambda = 8$) | 326.34 | 8.82 | 0.5116 | 1.5976 | 0.7288 |

---

### Conclusión: Selección del Controlador Óptimo

Tras el análisis exhaustivo de la Semana 6, se determina que el controlador **PID sintonizado mediante IMC con $\lambda = 9$** es el que ofrece el mejor desempeño para el sistema de refrigeración solar.

**Justificación Técnica:**
1. **Eficiencia en el Índice J:** El método IMC con $\lambda = 9$ logró reducir el índice global a **0.7265**. Esto representa una mejora significativa del **11.15%** respecto al mejor controlador PI desarrollado anteriormente.
2. **Superioridad sobre Ziegler-Nichols:** Aunque el método de Z-N ofrece la mayor precisión ($R1 = 0.46$), su esfuerzo de control ($TV = 20.47$) es inaceptable para la vida útil de los actuadores y penaliza el índice $J$ total.
3. **Punto de Retorno Decreciente:** Al probar con $\lambda = 8$, se observó que la ganancia en precisión ($R1$) ya no compensa el incremento en el esfuerzo de control ($R2$). El aumento del **4.2% en el TV** no justifica la pequeña reducción en el error, lo que convierte a **$\lambda = 9$** en el "punto necesario" de la sintonía.

Este controlador garantiza una excelente capacidad de rechazo a perturbaciones térmicas, manteniendo un equilibrio robusto entre la velocidad de respuesta y la integridad mecánica de la planta.