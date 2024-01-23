# A8. seien n=4, p=O.25, Y=x2 + 1. Man simuliere 1000 Werte flir Y. Man erstelle das Histogramm
# der absoluten Häufigkeiten für Y. Man schätze P(Y>5). Man vergleiche die geschätzte Wahrscheinlichkeit mit der
# theoretischen Wahrscheinlichkeit.

import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import binom

# Parameter für die Binomialverteilung
n = 4
p = 0.25

# Simulation von 1000 Werten für Y
X_values = np.random.binomial(n, p, 1000)
Y_values = X_values**2 + 1

# Histogramm der absoluten Häufigkeiten
plt.hist(Y_values, bins=np.arange(min(Y_values), max(Y_values) + 1.5) - 0.5, edgecolor='black', alpha=0.7)
plt.title('Histogramm der absoluten Häufigkeiten für Y')
plt.xlabel('Wert von Y')
plt.ylabel('Absolute Häufigkeit')
plt.show()

# Schätzung von P(Y>5)
estimated_p_Y_gt_5 = np.sum(Y_values > 5) / len(Y_values)
print(f"Schätzte Wahrscheinlichkeit P(Y>5): {estimated_p_Y_gt_5:.4f}")

# Theoretische Wahrscheinlichkeit für P(Y>5)
p_theoretical_Y_gt_5 = 1 - binom.cdf(5, n, p)**2
print(f"Theoretische Wahrscheinlichkeit P(Y>5): {p_theoretical_Y_gt_5:.4f}")
