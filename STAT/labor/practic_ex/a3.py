# A3. Die Lebensdauer eines elektronischen Gerätes werde als normalverteilt angenommen. Der Erwartungswert
# betrage 10000 Stunden, und die Standardabweichung 200 Stunden.
# Zufallsgröße X = die Lebensdauer des elektronischen Gerätes.
# a) Man simuliere N=IO mögliche Werte von X.
# b) Wie groß ist die theoretische Wahrscheinlichkeit, dass ein zufällig der Produktion entnommenes
# Fernsehgerät
# l) mehr als 1500 Stunden;
# 2) höchstens 6500 Stunden;
# 3) zwischen 7500 und 10500 Stunden
# läuft?

import numpy as np
from scipy.stats import norm

# Parameter der Normalverteilung
mean = 10000
std_dev = 200

# 1. Simulierte Werte für X
N = 10
simulated_values = np.random.normal(mean, std_dev, N)

# 2. Theoretische Wahrscheinlichkeiten
# a) Wahrscheinlichkeit, dass die Lebensdauer mehr als 1500 Stunden beträgt
p_more_than_1500 = 1 - norm.cdf(1500, mean, std_dev)
print(f"Die theoretische Wahrscheinlichkeit, dass die Lebensdauer mehr als 1500 Stunden beträgt, beträgt: {p_more_than_1500}")

# b) Wahrscheinlichkeit, dass die Lebensdauer höchstens 6500 Stunden beträgt
p_less_than_or_equal_6500 = norm.cdf(6500, mean, std_dev)
print(f"Die theoretische Wahrscheinlichkeit, dass die Lebensdauer höchstens 6500 Stunden beträgt, beträgt: {p_less_than_or_equal_6500}")

# c) Wahrscheinlichkeit, dass die Lebensdauer zwischen 7500 und 10500 Stunden liegt
p_between_7500_and_10500 = norm.cdf(10500, mean, std_dev) - norm.cdf(7500, mean, std_dev)
print(f"Die theoretische Wahrscheinlichkeit, dass die Lebensdauer zwischen 7500 und 10500 Stunden liegt, beträgt: {p_between_7500_and_10500}")
