# A24. Tom schießt auf eine Zielscheibe, und die Wahrscheinlichkeit, mit der sein Schuss die Zielscheibe trifft,
# beträgt p=0.3 (leider ist Tom kein geübter Schütze). Er möchte die Wahrscheinlichkeit für die Anzahl X der
# Schüsse wissen, bis (inklusiv) er zum ersten Mal die Zielscheibe trifft.
# (1) Man zeichne das Histogramm der absoluten Häufigkeiten für die Zufallsgröße X.
# (2) Man bestimme wie viele Schüsse durchschnittlich geschossen werden bis Tom die Zielscheibe trifft.
# (3) Man schätze P(X<5) und vergleiche diese mit der theoretischen Wahrscheinlichkeit.

import numpy as np
import matplotlib.pyplot as plt

# Number of simulations
N = 10000

# List to store the number of shots until success for each simulation
shots_until_success = []

# Simulating the process
for _ in range(N):
    shots = 0
    while np.random.rand() > 0.3:  # Keep shooting until a success (probability of hitting the target is 0.3)
        shots += 1
    shots_until_success.append(shots + 1)  # Add 1 to include the successful shot

# Calculate mean for the number of shots until the first success
mean_shots_until_success = np.mean(shots_until_success)

# Create a histogram
plt.hist(shots_until_success, bins=np.arange(1, np.max(shots_until_success) + 1, 1), edgecolor='black')
plt.title('Histogram of X (Number of Shots Until Success)')
plt.xlabel('X (Number of Shots)')
plt.ylabel('Absolute Frequency')
plt.show()

# Theoretical probability P(X < 5)
p_X_less_than_5_theoretical = (1 - 0.3) ** 4  # Probability of not hitting the target in the first 4 shots

# Compare the results
print(f"Average shots until success (simulation): {mean_shots_until_success:.2f}")
print(f"Theoretical probability P(X < 5): {p_X_less_than_5_theoretical:.4f}")
