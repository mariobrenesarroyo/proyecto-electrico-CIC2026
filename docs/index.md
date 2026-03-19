---
title: Bitácora Proyecto Eléctrico CIC2026
---

# Escuela de Ingeniería Eléctrica
## Universidad de Costa Rica

**Proyecto Eléctrico (IE-0499)** **Bitácora de Avances: Primer Semestre 2026**

---

# Proyecto Eléctrico CIC2026 – Categoría 1

Este proyecto corresponde a mi participación en el **Concurso de Ingeniería de Control 2026 (CIC2026)**, organizado por el Comité Español de Automática (CEA). 

El objetivo primordial es el diseño de un **controlador monovariable** para una máquina de absorción de frío solar de 35 kW (modelo Yazaki WFC10). El controlador debe ser capaz de regular la **temperatura de salida del evaporador ($T_{eva}$)**, rechazando perturbaciones externas críticas como variaciones en la temperatura del acumulador, del agua de la torre de refrigeración y las condiciones del ambiente.

---

## Diagrama del Sistema

![Diagrama de la máquina](imagenes/problema/diagrama_de_maquina.png)

![Esquema global del simulador](imagenes/problema/esquema_global_simulador.png)

---

## Variables de Operación

A continuación se detallan los parámetros de entrada y salida configurados en el entorno de **Simulink**:

### Entradas (Manipuladas y Perturbaciones)
| Variable | Nombre Simulink | Rango | Unidades | Sensor |
| :--- | :--- | :--- | :--- | :--- |
| Ratio de recirculación ($a_{ref}$) | `alpha_ref` | [0 – 1] | – | – |
| Temp. salida acumulador ($T_{tes}$) | `Ts_TES` | [77 – 100] | ºC | TT1 |
| Temp. entrada evaporador ($T_{eva}$) | `Te_Evap` | [10 – 30] | ºC | TT5 |
| Temp. torre refrigeración ref. ($T_{tor,ref}$) | `Te_Torr_ref` | [25 – 31] | ºC | – |
| Temp. ambiente ($T_{amb}$) | `T_amb` | [20 – 40] | ºC | – |

### Salidas (Monitoreadas)
| Variable | Nombre Simulink | Unidades | Sensor |
| :--- | :--- | :--- | :--- |
| Temp. salida evaporador ($T_{eva}$) | `Ts_Evap` | ºC | TT4 |
| Temp. salida generador ($T_{s\_gen}$) | `Ts_Gen` | ºC | TT3 |
| Temp. entrada generador ($T_{e\_gen}$) | `Te_Gen` | ºC | TT2 |
| Potencia absorbida evaporador ($Q_{Evap}$) | `Q_Evap` | kW | – |
| Potencia absorbida generador ($Q_{Gen}$) | `Q_Gen` | kW | – |
| Coeficiente de rendimiento (COP) | `COP` | – | – |
| Estado de bypass | `Bypass` | 0/1 | – |

---

## Restricciones Críticas de Operación

Para garantizar la integridad física de la máquina y evitar el bloqueo del sistema, se deben respetar los siguientes límites:

* **Generador:** $T_{gen} \in [75, 95]$ ºC
* **Evaporador:** $T_{eva} \ge 5$ ºC
* **Torre de refrigeración:** $T_{tor} \in [25, 32]$ ºC

!!! danger "Advertencia de Seguridad"
    Si alguna de estas condiciones se incumple, la máquina activa un **bypass interno** de forma automática y el sistema deja de producir frío inmediatamente.