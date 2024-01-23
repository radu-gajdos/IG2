# 5. Stichprobenvariablen in Histogrammen dargestellt: für die im Vektor X gegebenen Daten 
# zeichne man das Histogramm der absoluten, bzw. relativen Häufigkeiten. Man gebe an P(X<301).
# x -[299, 299 , 297, 303 , 299, 301, 300, 297, 302, 303, 300, 299, 301, 302, 301, 299, 300, 297, 300, 300, 296, 303, 295, 295, 2971

import matplotlib.pyplot as plt
import numpy as np

# Daten aus dem Vektor X
X = [299, 297, 303, 299, 301, 300, 297, 302, 303, 300, 299, 301, 302, 301, 299, 300, 297, 300, 300, 296, 303, 295, 295, 297]

# Histogramm der absoluten Häufigkeiten
plt.figure(figsize=(10, 5))
plt.subplot(1, 2, 1)
plt.hist(X, bins=range(294, 305), edgecolor='black', alpha=0.7)
plt.title('Histogramm der absoluten Häufigkeiten')
plt.xlabel('Wert')
plt.ylabel('Absolute Häufigkeit')
plt.grid(axis='y', linestyle='--', alpha=0.7)

# Histogramm der relativen Häufigkeiten
plt.subplot(1, 2, 2)
plt.hist(X, bins=range(294, 305), weights=np.ones(len(X)) / len(X), edgecolor='black', alpha=0.7)
plt.title('Histogramm der relativen Häufigkeiten')
plt.xlabel('Wert')
plt.ylabel('Relative Häufigkeit')
plt.grid(axis='y', linestyle='--', alpha=0.7)

plt.tight_layout()
plt.show()

# Berechnen von P(X < 301)
count_less_than_301 = sum(1 for x in X if x < 301)
probability_less_than_301 = count_less_than_301 / len(X)
print(f"P(X < 301) beträgt: {probability_less_than_301}")
