import numpy as np
from scipy.stats import uniform
import math

N = 1000

quader_min = -2
quader_max = 2

kugel_zentrum = np.array([0, 0, 0])
kugel_radius = 2

# a)
x = uniform.rvs(loc=quader_min, scale=quader_max-quader_min, size=N)
y = uniform.rvs(loc=quader_min, scale=quader_max-quader_min, size=N)
z = uniform.rvs(loc=quader_min, scale=quader_max-quader_min, size=N)
X = [math.dist([x[i],y[i],x[i]],[2,2,2]) for i in range(len(x))]
mean_X = np.mean(X)

print("a) Schätzung des Erwartungswerts von X:", mean_X)
