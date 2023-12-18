from scipy.stats import binom
import numpy
from matplotlib.pyplot import bar, show, hist, grid, legend, xticks

def Unid(y):
    N = 10000

    x_values = []
    for _ in range(N):
        x = 0
        while numpy.random.randint(1, 6) != y:
            x += 1
        x_values.append(x)
    return x_values

X = Unid(5)
print(numpy.mean(X))
