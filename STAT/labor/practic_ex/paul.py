import numpy as np
import matplotlib.pyplot as plt

# Gegebene Wahrscheinlichkeiten für X und Y
werte_X = np.array([-2,-1,1,2,3])
wahrscheinlichkeiten_X = np.array([0.2, 0.2, 0.2, 0.2,0.2])

werte_Y = np.array([-2,-1,1,2,3])
wahrscheinlichkeiten_Y = np.array([0.2, 0.2, 0.2, 0.2,0.2])

# a) Generiere 2000 zufällige Daten für X + Y
N = 2000
simulierte_werte_X = np.random.choice(werte_X, N, p=wahrscheinlichkeiten_X)
simulierte_werte_Y = np.random.choice(werte_Y, N, p=wahrscheinlichkeiten_Y)
simulierte_werte_XY = simulierte_werte_X + simulierte_werte_Y

# b) Histogramm der relativen Häufigkeiten von X + Y
plt.hist(simulierte_werte_XY, bins=np.arange(min(simulierte_werte_XY), max(simulierte_werte_XY) + 1, 1), density=True, edgecolor='black')
plt.title('Histogramm der relativen Häufigkeiten von X + Y')
plt.xlabel('X + Y')
plt.ylabel('Relative Häufigkeit')
plt.show()

# Schätzung von P(X + Y < 1)
geschätzte_wahrscheinlichkeit_XY_kleiner_als_1 = np.sum(simulierte_werte_XY > 2) / N
print(f"Schätzung für P(X + Y > 2): {geschätzte_wahrscheinlichkeit_XY_kleiner_als_1:.4f}")

# c) Alternative Methode für theoretische Wahrscheinlichkeitsverteilung von X + Y
werte_XY = []
wahrscheinlichkeiten_XY = []

for wert_X, wahrscheinlichkeit_X in zip(werte_X, wahrscheinlichkeiten_X):
    for wert_Y, wahrscheinlichkeit_Y in zip(werte_Y, wahrscheinlichkeiten_Y):
        wert_XY = wert_X + wert_Y
        wahrscheinlichkeit_XY = wahrscheinlichkeit_X * wahrscheinlichkeit_Y
        werte_XY.append(wert_XY)
        wahrscheinlichkeiten_XY.append(wahrscheinlichkeit_XY)

werte_XY = np.array(werte_XY)
wahrscheinlichkeiten_XY = np.array(wahrscheinlichkeiten_XY)

print("\nAlternative theoretische Wahrscheinlichkeitsverteilung von X + Y:")
for wert, wahrscheinlichkeit in zip(werte_XY, wahrscheinlichkeiten_XY):
    print(f"P(X + Y = {wert}): {wahrscheinlichkeit:.2f}")

# Alternative theoretische Wert für P(X + Y < 1)
theoretische_wahrscheinlichkeit_XY_kleiner_als_1 = np.sum(wahrscheinlichkeiten_XY[werte_XY > 2])
print(f"Alternative theoretische Wahrscheinlichkeit für P(X + Y > 2): {theoretische_wahrscheinlichkeit_XY_kleiner_als_1:.4f}")
