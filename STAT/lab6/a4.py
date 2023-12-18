import numpy as np
from scipy.stats import uniform

N = 100000

B_values = uniform.rvs(loc=-1, scale=2, size=N)
C_values = uniform.rvs(loc=-1, scale=2, size=N)

# a)
real_roots_probability = np.mean(B_values**2 - 4*1*C_values >= 0)

print("a) Wahrscheinlichkeit beide Wurzeln reell:", real_roots_probability)


# b)
positive_roots_probability = np.mean(np.logical_and(B_values**2 - 4*C_values >= 0, (-B_values - np.sqrt(B_values**2 - 4*1*C_values)) > 0))

# c)
print("b) Wahrscheinlichkeit beide Wurzeln positiv:", positive_roots_probability)