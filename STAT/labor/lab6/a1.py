import numpy as np
import random

X = np.array([4, 5, 6, 7, 8, 9, 10])
P = np.array([0.05, 0.1, 0.1, 0.35, 0.2, 0.1, 0.1])

N=10000

D = np.array(random.choices(X, weights=P, k=N))

#a
mean_X = np.mean(D)
var_X = np.var(D)

P_X_mme_7 = np.sum(D <= 7) / len(D)
P_X_mm_4 = np.sum(D > 4) / len(D)

print("\nSimulierte Werte:")
print("E(X):", mean_X)
print("V(X):", var_X)
print("P(X <= 7):", P_X_mme_7)
print("P(X > 4):", P_X_mm_4)

#b
mean_th = np.sum(X * P)
var_th = np.sum(X**2 * P) - mean_th**2
P_th_leq_7 = np.sum(P[X <= 7])
P_th_gt_4 = np.sum(P[X > 4])

print("\nTheoretische Werte:")
print("Erwartungswert E(X):", mean_th)
print("Varianz V(X):", var_th)
print("P(X <= 7):", P_th_leq_7)
print("P(X > 4):", P_th_gt_4)

#c
import matplotlib.pyplot as plt

d,c=np.unique(D,return_counts=True)
plt.bar(d,c/N,width=0.8, edgecolor='black', color='blue')
plt.title('relativen Häufigkeiten')
plt.show()


plt.bar(d,c,width=0.8, edgecolor='black', color='red')
plt.title('absolute Häufigkeiten')
plt.show()


