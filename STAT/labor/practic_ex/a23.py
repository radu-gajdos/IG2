# A23. In einer Lostrommel sind 10 Gewinnlose und 30 Nieten. Wie groß ist die Wahrscheinlichkeit,
# dass man bei dreimaligem Ziehen a) mindestens ein Gewinnlos zieht? b) nur Nieten zieht? Welche ist die
# theoretische Wahrscheinlichkeitsverteilung der Zufallsgröße X: Anzahl der Gewinnlose beim dreimaligen
# Ziehen?

import numpy as np
from scipy.stats import binom

# Number of simulations
N = 10000

# Simulate drawing three tickets with replacement (binomial distribution)
simulated_values_X = np.random.binomial(3, 10/40, N)

# Calculate probability of drawing at least one winning ticket (P(X >= 1))
p_at_least_one_winning_ticket_simulated = np.sum(simulated_values_X >= 1) / N

# Calculate probability of drawing only blanks (P(X = 0))
p_only_blanks_simulated = np.sum(simulated_values_X == 0) / N

# Theoretical probability of drawing at least one winning ticket (P(X >= 1))
p_at_least_one_winning_ticket_theoretical = 1 - binom.cdf(0, 3, 10/40)

# Theoretical probability of drawing only blanks (P(X = 0) for each draw, raised to the power of 3)
p_only_blanks_theoretical = binom.cdf(0, 3, 30/40) ** 3

# Compare the results
print(f"Simulated probability of drawing at least one winning ticket: {p_at_least_one_winning_ticket_simulated:.4f}")
print(f"Theoretical probability of drawing at least one winning ticket: {p_at_least_one_winning_ticket_theoretical:.4f}")

print(f"Simulated probability of drawing only blanks: {p_only_blanks_simulated:.4f}")
print(f"Theoretical probability of drawing only blanks: {p_only_blanks_theoretical:.4f}")
