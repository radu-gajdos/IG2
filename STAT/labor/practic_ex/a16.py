# 16. Sei X eine binomialverteile Zufallsgröße mit Parametern 11—10, p=0.3. Man simuliere 1000 zufällige
# erte für X. Man schätze 
# a) die Wahrscheinlichkeit, dass P(3< X< 7) 
# b) den Erwartungswert von X; 
# c) die Varianz von X. Man vergleiche die erhaltenen Ergebnisse mit den theoretischen Werten.

import numpy as np
from scipy.stats import binom

# Parameters
n = 10
p = 0.3
N = 100000

# Simulate 1000 random values for X
simulated_values = np.random.binomial(n, p, N)

# a) Schätzung der Wahrscheinlichkeit P(3 < X < 7)
estimated_probability = np.sum((simulated_values > 3) & (simulated_values < 7)) / N
print(f"a) Geschätzte Wahrscheinlichkeit P(3 < X < 7): {estimated_probability:.4f}")

# b) Schätzung des Erwartungswerts von X
estimated_mean = np.mean(simulated_values)
print(f"b) Geschätzter Erwartungswert von X: {estimated_mean:.4f}")

# c) Schätzung der Varianz von X
estimated_variance = np.var(simulated_values, ddof=1)  # ddof=1 for sample variance
print(f"c) Geschätzte Varianz von X: {estimated_variance:.4f}")

# Theoretische Werte
theoretical_mean = n * p
theoretical_variance = n * p * (1 - p)

print("\nTheoretische Werte:")
print(f"Theoretischer Erwartungswert von X: {theoretical_mean}")
print(f"Theoretische Varianz von X: {theoretical_variance}")
