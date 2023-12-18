import numpy as np
import matplotlib.pyplot as plt

anzahl_0 = 10
anzahl_1 = 20
anzahl_2 = 20

gesamtanzahl = anzahl_0 + anzahl_1 + anzahl_2

N = 100000

ziehungen = np.random.choice([0, 1, 2], size=(N, 3), p=[anzahl_0 / gesamtanzahl,
                                                        anzahl_1 / gesamtanzahl,
                                                        anzahl_2 / gesamtanzahl])
produkte = np.product(ziehungen, axis=1)

erwartungswert_X = np.mean(produkte)
varianz_X = np.var(produkte)

print("Geschätzter Erwartungswert von X:", erwartungswert_X)
print("Geschätzte Varianz von X:", varianz_X)


p, c = np.unique(produkte, return_counts=True)
plt.bar(p, c, width=1, edgecolor='black', color='blue')
plt.title('Absolute Häufigkeiten (Simulation)')
plt.show()

theoretische_wahrscheinlichkeiten = [(anzahl_0 / gesamtanzahl) ** 3,
                                     (anzahl_1 / gesamtanzahl) ** 3,
                                     (anzahl_2 / gesamtanzahl) ** 3]

plt.bar([0, 1, 2], theoretische_wahrscheinlichkeiten, width=1, edgecolor='black', color='red')
plt.title('Theoretische Wahrscheinlichkeiten von X')
plt.xlabel('Wert von X')
plt.ylabel('Wahrscheinlichkeit')
plt.show()

