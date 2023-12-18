import numpy
from random import randrange
from matplotlib.pyplot import bar, show, hist, grid, legend, xticks

N=1000
x=[-6,6]
P=[1-0.77, 0.77]
rng = numpy.random.default_rng()
r=rng.choice(x, size=N , replace=True, p=P)

print(r.mean())