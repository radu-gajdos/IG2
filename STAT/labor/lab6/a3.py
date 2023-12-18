import numpy as np
from scipy.stats import uniform, expon

# a) Schätzung der Wahrscheinlichkeit, dass das Drucken mehr als 5 Sekunden dauert

p_D1 = 0.4
p_D2 = 0.6

T1_distribution = expon(scale=5)
T2_distribution = uniform(loc=4, scale=2)

T1 = T1_distribution.rvs(size=1000)
T2 = T2_distribution.rvs(size=1000)

T_mm_5 = (T1 > 5) | (T2 > 5)
P_mm_5 = np.mean(T_mm_5)

print("a) Wahrscheinlichkeit Drucken mehr als 5 Sekunden:", P_mm_5)

# b)

mean_T1 = np.mean(T1)
std_T1 = np.std(T1)

mean_T2 = np.mean(T2)
std_T2 = np.std(T2)

print("\nb)T1:")
print("   Erwartungswert:", mean_T1)
print("   Standardabweichung:", std_T1)

print("\n T2:")
print("   Erwartungswert:", mean_T2)
print("   Standardabweichung:", std_T2)
