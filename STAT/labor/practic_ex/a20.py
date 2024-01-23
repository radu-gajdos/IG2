# A20. Ein „Glücksrad" hat vier gleichgroße Felder. Eines davon ist das Gewinnfeld. Wie groß ist die
# Wahrscheinlichkeit, dass beim viermaligen Drehen mindestens einmal ein Gewinn gedreht wird? (Antwort
# anhand Simulationen)
# Welche ist die theoretische Wahrscheinlichkeitsverteilung der Zufallsgröße X: Anzahl Gewinne in 4 Drehungen
# des Glücksrads.

import numpy as np
from scipy.stats import binom

# Number of simulations
N = 10000

# Simulate drawing four tickets with replacement (binomial distribution)
simulated_values_X = np.random.binomial(4, 1/4, N)

# Calculate probability of drawing at least one winning ticket (P(X >= 1))
p_at_least_one_winning_ticket_simulated = np.sum(simulated_values_X >= 1) / N

# Compare the results
print(f"Simulated probability of drawing at least one winning ticket: {p_at_least_one_winning_ticket_simulated:.4f}")


# Theoretical probability distribution for the number of wins
werte_X = np.arange(0, 5)
wahrscheinlichkeiten_X_theoretical = binom.pmf(werte_X, 4, 1/4)

# Compare the theoretical distribution
print("\nTheoretical Probability Distribution:")
for wert, wahrscheinlichkeit in zip(werte_X, wahrscheinlichkeiten_X_theoretical):
    print(f"P(X = {wert}): {wahrscheinlichkeit:.4f}")


    import numpy as np

N = 2000
