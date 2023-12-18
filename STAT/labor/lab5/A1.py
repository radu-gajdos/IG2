import matplotlib.pyplot as plt
from scipy.stats import norm
import numpy as np

mu = 199
sigma = 3
N = 1000

Daten = norm.rvs(mu, sigma, N)

print(Daten)

mean_abgefullte_menge = np.mean(Daten)

print(f"Mittelwert: {mean_abgefullte_menge} g")

prob_less_than_195g = norm.cdf(195, mu, sigma)
print(f"Wahrscheinlichkeit 195 g Tee abgefüllt werden: {prob_less_than_195g:.4f}")

prob_between_195g_and_198g = norm.cdf(198, mu, sigma) - norm.cdf(195, mu, sigma)
print(f"Wahrscheinlichkeit zwischen 195 g und 198 g Tee abgefüllt werden: {prob_between_195g_and_198g:.4f}")

prob_more_than_195g = 1 - norm.cdf(195, mu, sigma)
print(f"Wahrscheinlichkeit mehr als 195 g Tee abgefüllt werden: {prob_more_than_195g:.4f}")

hist, bins, _ = plt.hist(Daten, bins=16, density=True, edgecolor="black", label="rel. Hfg.")

x = np.linspace(min(Daten)-2, max(Daten)+2, 100)

linie = norm.pdf(x, mu, sigma)

plt.plot(x, linie, color="red", label="dichte fkt")

plt.title('Histogram')
plt.xlabel('Menge Tee (g)')
plt.legend()

plt.show()

Hfg, Klasse=np.histogram(Daten, bins=16)


for i, count in enumerate(Hfg):
    jos = Klasse[i]
    sus = Klasse[i + 1]
    print(f"abs. Hfg. {count} - Klasse [{jos:.4f}, {sus:.4f}]")

