import numpy
from random import randrange
from matplotlib.pyplot import bar, show, hist, grid, legend, xticks

N=1000
x=[0,1,2,3]
P=[0.4, 0.266, 0.166, 0.166]
rng = numpy.random.default_rng()
r=rng.choice(x, size=N , replace=True, p=P)

print(r.mean())