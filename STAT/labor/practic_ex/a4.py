# A4. Betrachten wir die statistischen Daten aus einer Stichprobe:
# 309 , 333 , 309 , 330, 325, 325 , 325 , 333 , 314 , 314, 330, 314, 314, 330
# 1
# vom Umfang n 14 für die Lebensdauer in Stunden einer bestimmten elektronischen Komponente. Diese
# Stichprobe dient zur Untersuchung des Merkmals (Zufallsgröße) X : die Lebensdauer der elektronischen
# Komponente.
# a) Welches ist die durchschnittliche Lebensdauer der Glühbirnen?
# b) Welches ist die empirische Standardabweichung?
# c) Man schätze anhand dieser Daten P(X>310).

import numpy as np

# Stichprobendaten
data = [309, 333, 309, 330, 325, 325, 325, 333, 314, 314, 330, 314, 314, 330]

# 1. Durchschnittliche Lebensdauer (arithmetisches Mittel)
average_lifetime = sum(data) / len(data)
print(f"Durchschnittliche Lebensdauer: {average_lifetime}")

# 2. Empirische Standardabweichung
std_dev_lifetime = np.std(data, ddof=1)  # ddof=1 für die Stichproben-Standardabweichung
print(f"Empirische Standardabweichung: {std_dev_lifetime}")

# 3. Schätzung für P(X > 310)
count_greater_than_310 = sum(1 for d in data if d > 310)
probability_greater_than_310 = count_greater_than_310 / len(data)
print(f"Schätzung für P(X > 310): {probability_greater_than_310}")
