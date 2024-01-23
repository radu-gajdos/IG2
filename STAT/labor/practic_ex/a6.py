# A6. Eine Maschine produziert im Mittel 10mm lange Schrauben mit einer Standardabweichung von Imm. Die
# Länge der Schrauben kann als normalverteilt angesehen werden. 
# Anhand von (a) Simulationen (b) spezifischen
# Anweisungen berechne man die geschätzte bzw. theoretische Wahrscheinlichkeit dafür, dass
# • eine Schraube kürzer ist als 9 mm;
# • eine Schraube höchstens 10.1 mm und mindestens 8.9 mm lang ist;

import numpy as np

# Parameter der Normalverteilung
mean = 10
std_dev = 1

# Anzahl der Simulationen
N = 100000

# Simulierte Längen der Schrauben
simulated_lengths = np.random.normal(mean, std_dev, N)

# Geschätzte Wahrscheinlichkeit, dass eine Schraube kürzer als 9 mm ist
p_shorter_than_9 = np.sum(simulated_lengths < 9) / N
print(f"Geschätzte Wahrscheinlichkeit, dass eine Schraube kürzer als 9 mm ist: {p_shorter_than_9:.4f}")

# Geschätzte Wahrscheinlichkeit, dass eine Schraube höchstens 10.1 mm und mindestens 8.9 mm lang ist
p_between_8_9_and_10_1 = np.sum((simulated_lengths >= 8.9) & (simulated_lengths <= 10.1)) / N
print(f"Geschätzte Wahrscheinlichkeit, dass eine Schraube zwischen 8.9 mm und 10.1 mm lang ist: {p_between_8_9_and_10_1:.4f}")


from scipy.stats import norm

# a) Theoretische Wahrscheinlichkeit, dass eine Schraube kürzer als 9 mm ist
p_theoretical_shorter_than_9 = norm.cdf(9, mean, std_dev)
print(f"Theoretische Wahrscheinlichkeit, dass eine Schraube kürzer als 9 mm ist: {p_theoretical_shorter_than_9:.4f}")

# b) Theoretische Wahrscheinlichkeit, dass eine Schraube höchstens 10.1 mm und mindestens 8.9 mm lang ist
p_theoretical_between_8_9_and_10_1 = norm.cdf(10.1, mean, std_dev) - norm.cdf(8.9, mean, std_dev)
print(f"Theoretische Wahrscheinlichkeit, dass eine Schraube zwischen 8.9 mm und 10.1 mm lang ist: {p_theoretical_between_8_9_and_10_1:.4f}")
