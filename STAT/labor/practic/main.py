import numpy as np
from matplotlib.pyplot import bar, show, hist, grid, legend, xticks
from math import comb


N = 20000

werte_X = np.array([0, 1])
wahrscheinlichkeiten_X = np.array([0.5, 0.5])

simulierte_werte_X = np.random.choice(werte_X, N, p=wahrscheinlichkeiten_X)

# a
vier_x = np.random.choice(werte_X, 4, p=wahrscheinlichkeiten_X)
print(vier_x)
z_specific = np.sum(vier_x == 1)
print(z_specific)

Z_werte = []

for _ in range(N):
    vier_x = np.random.choice(werte_X, 4, p=wahrscheinlichkeiten_X)
    z_specific = np.sum(vier_x == 1)
    Z_werte.append(z_specific)

Z_werte = np.array(Z_werte)

relativ_Z_0 = np.sum(Z_werte == 0) / N
relativ_Z_1 = np.sum(Z_werte == 1) / N
relativ_Z_2 = np.sum(Z_werte == 2) / N
relativ_Z_3 = np.sum(Z_werte == 3) / N
relativ_Z_4 = np.sum(Z_werte == 4) / N

print(f"Relative Wsch\n")
print(f"P(Z = 0): {relativ_Z_0:.4f}")
print(f"P(Z = 1): {relativ_Z_1:.4f}")
print(f"P(Z = 2): {relativ_Z_2:.4f}")
print(f"P(Z = 3): {relativ_Z_3:.4f}")
print(f"P(Z = 4): {relativ_Z_4:.4f}")

# b
theoretic_Z_0 = 1 / 2 * 1 / 2 * 1 / 2 * 1 / 2
theoretic_Z_1 = comb(4,1)*(1 / 2 * 1 / 2 * 1 / 2 * 1 / 2)
theoretic_Z_2 = comb(4,2)*(1 / 2 * 1 / 2 * 1 / 2 * 1 / 2)
theoretic_Z_3 = comb(4,1)*(1 / 2 * 1 / 2 * 1 / 2 * 1 / 2)
theoretic_Z_4 = 1 / 2 * 1 / 2 * 1 / 2 * 1 / 2

print(f"\nTheoretische Wsch\n")
print(f"P(Z = 0): {theoretic_Z_0:.4f}")
print(f"P(Z = 1): {theoretic_Z_1:.4f}")
print(f"P(Z = 2): {theoretic_Z_2:.4f}")
print(f"P(Z = 3): {theoretic_Z_3:.4f}")
print(f"P(Z = 4): {theoretic_Z_4:.4f}")


# c
z, count = np.unique(Z_werte, return_counts=True)
d = dict([(z[i], count[i] / N) for i in z])
bar(
    z,
    count / N,
    width=0.9,
    color="red",
    edgecolor="black",
    label=" relative Haufigkeiten ",
)
grid()
show()

# d

wahrscheinlichkeit_Z_gr_1 = np.sum(Z_werte > 1) / N
th_wahrscheinlichkeit_Z_gr_1 = theoretic_Z_2 + theoretic_Z_3 + theoretic_Z_4


print(f"\nRel P(Z > 1): {wahrscheinlichkeit_Z_gr_1:.4f}")
print(f"Th P(Z > 1): {th_wahrscheinlichkeit_Z_gr_1:.4f}")
