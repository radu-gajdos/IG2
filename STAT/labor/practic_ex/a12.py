# A 12. Ein sechsseitiger Würfel Wird aufvier Seiten mit einer 1 und auf zwei Seiten mit einer 2 übermalt. Er Wird
# zweimal geworfen.
# 1) Die Zufallsvariable X gibt die Summe der erhaltenen Zahlen an. Man gebe alle möglichen Werte von X an und
# die entsprechenden theoretischen Wahrscheinlichkeiten.
# 2) Anhand von Simulationen schätze man
# 2a) die zu envartende Summe (d.h. E(X)) • 2b) die Wahrscheinlichkeit dafür, dass die Summe größer als 2 ist.

import numpy as np

# Corrected possible values of the die
wuerfel_werte = [1, 1, 1, 1, 2, 2]

# 1) Possible values of X and corresponding theoretical probabilities
moegliche_x_werte = np.array([2, 3, 4])  # Possible values of X (sum of two die rolls)
theoretische_wahrscheinlichkeiten = np.array([wuerfel_werte.count(x) / len(wuerfel_werte) ** 2 for x in moegliche_x_werte])

# 2) Simulations
N = 100000
simulierte_wuerfe = np.random.choice(wuerfel_werte, size=(N, 2), replace=True)

# 2a) Estimate of the expected sum E(X)
erwartete_summe = np.mean(np.sum(simulierte_wuerfe, axis=1))
print(f"2a) Estimated expected sum (E(X)): {erwartete_summe:.4f}")

# 2b) Estimate of the probability P(X > 2)
wahrscheinlichkeit_gt_2 = np.sum(np.sum(simulierte_wuerfe, axis=1) > 2) / N
print(f"2b) Estimated probability P(X > 2): {wahrscheinlichkeit_gt_2:.4f}")
