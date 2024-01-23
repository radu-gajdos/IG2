# A 10. Die Zufallsvariable X sei normalverteilt mit Erwartungswert gleich 3 und Varianz gleich 4.
# Man schätze P(IAI > 4) anhand von
# (a) Simulationen;
# (b) spezifischen Anweisungen der Normalverteilung.

import numpy as np

# Parameters of the normal distribution
mu = 3
sigma = 2

# Number of simulations
N = 100000

# Simulate N values for X
X_values = np.random.normal(mu, sigma, N)

# Estimate P(|X| > 4) by counting events
estimated_p_absolute_gt_4 = np.sum(np.abs(X_values) > 4) / N
print(f"Estimated probability P(|X| > 4) through simulations: {estimated_p_absolute_gt_4:.4f}")


from scipy.stats import norm

# Use the normal distribution functions in Python
p_absolute_gt_4 = 1 - norm.cdf(4, mu, sigma) + norm.cdf(-4, mu, sigma)
print(f"Theoretical probability P(|X| > 4) through specific instructions: {p_absolute_gt_4:.4f}")
