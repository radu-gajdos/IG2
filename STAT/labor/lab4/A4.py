from scipy.stats import binom
import numpy
from matplotlib.pyplot import bar, show, hist, grid, legend, xticks

N = 1000
n = 7
p = 0.4
X = binom.rvs(n, p, size=N)
z, count = numpy.unique(X, return_counts=True)

theoretical_probabilities = {k: binom.pmf(k, n, p) for k in range(0, n + 1)}

anzahlMaxDrei = count[0] + count[1] + count[2] + count[3]
tanzahlMaxDrei = 0
for k, v in theoretical_probabilities.items():
    if k <= 3:
        tanzahlMaxDrei += v
print("Relativ hochstens 3 Rechner", anzahlMaxDrei / N)
print("P( X <=", 3, f")={tanzahlMaxDrei:.6f}")

anzahlMinVier = count[4] + count[5] + count[6] + count[7]
tanzahlMinVier = 0
for k, v in theoretical_probabilities.items():
    if k >= 4:
        tanzahlMinVier += v
print("Relativ mindesten 4 Rechner", anzahlMinVier / N)
print("P( X >=", 4, f")={tanzahlMinVier:.6f}")

anzahlVier = count[4]
print("Relativ mindesten 4 Rechner", anzahlVier / N)
print("P( X =", 4, f")={binom.pmf(4,n,p):.6f}")
