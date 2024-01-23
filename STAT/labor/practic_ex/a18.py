# A 18. Die Niederschlagsmenge (im Monat September) in einer bestimmten Region ist normal-verteilt und ist im
# Durchschnitt 60 Liter/Quadratmeter mit einer Standardabweichung von 5 Liter/Quadratmeter. Man simuliere
# 1000 (solche) statistische Daten. Man schätze anhand der Daten, die Wahrscheinlichkeit, dass die
# Niederschlagsmenge mehr als 55 Liter Quadratmeter ist. Man vergleiche das geschätzte Ergebnis mit dem
# theoretischen Wert.

import numpy as np

# Parameters for the normal distribution
mean = 60
std_dev = 5

# Number of simulations
N = 1000

# Simulate data points from the normal distribution
simulated_values = np.random.normal(mean, std_dev, N)

# Estimate the probability that the precipitation is more than 55 liters/square meter
estimated_probability = np.sum(simulated_values > 55) / N

# Compare the results
print(f"Simulated probability of precipitation more than 55 liters/square meter: {estimated_probability:.4f}")

# Theoretical probability using the cumulative distribution function (CDF)
from scipy.stats import norm

theoretical_probability = 1 - norm.cdf(55, mean, std_dev)
print(f"Theoretical probability of precipitation more than 55 liters/square meter: {theoretical_probability:.4f}")
