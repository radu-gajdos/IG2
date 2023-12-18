import matplotlib.pyplot as plt
import scipy
from scipy.stats import norm
import numpy as np

alpha=1/12
N=1000

Daten = scipy.stats.expon.rvs(loc=0,scale=1/alpha,size=N)

hist, bins, _ = plt.hist(Daten, bins=12, density=True, edgecolor="black", label="rel. Hfg.")

x = np.linspace(min(Daten), max(Daten)+2, 100)

linie = scipy.stats.expon.pdf(x,loc=0,scale=1/alpha)

plt.plot(x, linie, color="red", label="dichte fkt")

plt.title('Histogram')
plt.xlabel('Menge Tee (g)')
plt.legend()

plt.show()

prob_less_than_20 = scipy.stats.expon.cdf(20,loc=0,scale=1/alpha)
print(f"P(T<20) = {prob_less_than_20}")

prob_more_than_10 = 1-scipy.stats.expon.cdf(10,loc=0,scale=1/alpha)
print(f"P(T>10) = {prob_more_than_10}")

prob = scipy.stats.expon.cdf(30,loc=0,scale=1/alpha) - scipy.stats.expon.cdf(10,loc=0,scale=1/alpha)
print(f"P(10<T<30) = {prob}")



hist, bins, _ = plt.hist(Daten, bins=12, density=False, edgecolor="black", label="abs. Hfg.")
plt.show()


datenNeu = scipy.stats.expon.rvs(loc=0,scale=1/1,size=N)

x = np.linspace(0, 10, 100)

linie = scipy.stats.expon.pdf(x,loc=0,scale=1/1)

plt.plot(x, linie, color="green", label="dichte fkt von Exp(1)")
plt.legend()
plt.show()