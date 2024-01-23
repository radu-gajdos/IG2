import numpy
from random import randrange
from matplotlib.pyplot import bar, show, hist, grid, legend, xticks

N=1000
x=[0 ,1 ,2 ,5]
P=[0.4 ,0.1 ,0.3 ,0.2]
rng = numpy.random.default_rng()
r=rng.choice(x, size=N , replace=True, p=P)

z, count = numpy.unique(r, return_counts=True)
d = dict([(z[i], count[i] / N) for i in range(0, 4)])
print(d)
bar(
    z,
    count / N,
    width=0.9,
    color="red",
    edgecolor="black",
    label=" relative Haufigkeiten ",
)
D = {x[i]: P[i] for i in range(len(x))}
bar(
    D.keys(),
    D.values(),
    width=0.7,
    color="blue",
    edgecolor="black",
    label="theoretische Haufigkeiten",
)
legend(loc="lower left")
xticks(range(0, 7))
grid()
show()


