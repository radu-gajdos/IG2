from scipy.stats import uniform
import numpy as np
import matplotlib.pyplot as plt

N=2000

# Parameter der gleichverteilten Zufallsgröße X
lower_limit = 10
upper_limit = 20

# 1. Simulierte Wahrscheinlichkeit
simulierte_werte = np.random.uniform(lower_limit, upper_limit, N)
simulierte_wahrscheinlichkeit = np.sum((simulierte_werte >= 14) & (simulierte_werte <= 18)) / N
print(f"Simulierte Wahrscheinlichkeit: {simulierte_wahrscheinlichkeit:.4f}")

# 2. Theoretische Wahrscheinlichkeit
theoretische_wahrscheinlichkeit = uniform.cdf(18, loc=lower_limit, scale=(upper_limit - lower_limit)) - uniform.cdf(14, loc=lower_limit, scale=(upper_limit - lower_limit))
print(f"Theoretische Wahrscheinlichkeit: {theoretische_wahrscheinlichkeit:.4f}")

# 1. Simulierte Wahrscheinlichkeit
simulierte_wahrscheinlichkeit_lesse_15 = np.sum(simulierte_werte <= 18) / N
print(f"Simulierte Wahrscheinlichkeit: {simulierte_wahrscheinlichkeit:.4f}")

# 2. Theoretische Wahrscheinlichkeit
theoretische_wahrscheinlichkeit_lesse_15 = uniform.cdf(15, loc=lower_limit, scale=(upper_limit - lower_limit))
print(f"Theoretische Wahrscheinlichkeit: {theoretische_wahrscheinlichkeit_lesse_15:.4f}")

# 1. Simulierte Wahrscheinlichkeit
#so that X<=15 or X>=17
simulierte_wahrscheinlichkeit_combined = np.sum((simulierte_werte <= 15) | (simulierte_werte >= 17)) / N
print(f"Simulierte Wahrscheinlichkeit: {simulierte_wahrscheinlichkeit:.4f}")

theoretische_wahrscheinlichkeit_combined = uniform.cdf(15, loc=lower_limit, scale=(upper_limit - lower_limit)) + (1 - uniform.cdf(18, loc=lower_limit, scale=(upper_limit - lower_limit)))
print(f"Theoretische Wahrscheinlichkeit: {theoretische_wahrscheinlichkeit:.4f}")


plt.hist(simulierte_werte, bins=range(10, 21), edgecolor='black', alpha=0.7)
plt.title('Histogram of X (Durchlaufzeit)')
plt.xlabel('Durchlaufzeit (Minutes)')
plt.ylabel('Absolute Frequency')
plt.legend()
plt.show()
