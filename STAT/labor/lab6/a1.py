import numpy as np
import matplotlib.pyplot as plt

# Daten aus dem Vektor X
X = np.array([299, 297, 303, 299, 301, 300, 297, 302, 303, 300, 299, 301, 302, 301, 299, 300, 297, 300, 300, 296, 303, 295, 295, 297])
N = len(X)

mean_X = np.mean(X)
var_X = np.var(X, ddof=1)

P_X_lt_301 = np.sum(X < 301) / N

print("\nSimulierte Werte:")
print("E(X):", mean_X)
print("V(X):", var_X)
print("P(X < 301):", P_X_lt_301)

d, c = np.unique(X, return_counts=True)

# Histogramm der relativen Häufigkeiten
plt.figure(figsize=(8, 4))
plt.bar(d, c / N, width=0.8, edgecolor='black', color='blue')
plt.title('Histogramm der relativen Häufigkeiten')
plt.xlabel('Wert')
plt.ylabel('Relative Häufigkeit')
plt.show()

# Histogramm der absoluten Häufigkeiten
plt.figure(figsize=(8, 4))
plt.bar(d, c, width=0.8, edgecolor='black', color='red')
plt.title('Histogramm der absoluten Häufigkeiten')
plt.xlabel('Wert')
plt.ylabel('Absolute Häufigkeit')
plt.show()
