# A21. Peter trifft erfahrungsgemäß bei 85 % seiner Torschüsse vom Elfmeterpunkt. Wie groß ist die
# Wahrscheinlichkeit, dass er bei drei Versuchen mindestens einmal daneben schießt? (Antwort anhand
# Simulationen)
# Welche ist die theoretische Wahrscheinlichkeitsverteilung der Zufallsgröße X: Anzahl der getroffenen
# Torschüsse von Peter vom Elfmeterpunkt in 3 Versuchen?

import numpy as np
from scipy.stats import binom

# Probability of Peter hitting the target
p_success = 0.85

# Number of simulations
N = 100000

# Simulate three penalty shots (binomial distribution)
simulated_values_X = np.random.binomial(3, p_success, N)


# Calculate probability of missing at least once (P(X >= 1))
p_miss_at_least_once_simulated = np.sum(simulated_values_X < 3) / N

# Theoretical probability distribution for the number of successful shots
werte_X = np.arange(0, 4)
wahrscheinlichkeiten_X_theoretical = binom.pmf(werte_X, 3, p_success)

# Compare the results
print(f"Simulated probability of missing at least once in three shots: {p_miss_at_least_once_simulated:.4f}")

print("\nTheoretical Probability Distribution:")
for wert, wahrscheinlichkeit in zip(werte_X, wahrscheinlichkeiten_X_theoretical):
    print(f"P(X = {wert}): {wahrscheinlichkeit:.4f}")
