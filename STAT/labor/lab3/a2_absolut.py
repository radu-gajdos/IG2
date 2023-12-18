import numpy
from random import randrange
from matplotlib.pyplot import bar, show, hist, grid, legend, xticks

N = 200
daten = [randrange(1, 7) for _ in range(N)]
print(daten)
z, count = numpy.unique(daten, return_counts=True)
d = dict([(z[i], count[i]) for i in range(0, 6)])
print(d)
bar(
    z,
    count,
    width=0.9,
    color="red",
    edgecolor="black",
    label=" absolute Haufigkeiten ",
)
D = dict([(k, N/6) for k in range(1, 7)])
bar(
    D.keys(),
    D.values(),
    width=0.7,
    color="blue",
    edgecolor="black",
    label="absolute theoretische Haufigkeiten",
)
legend(loc="lower left")
xticks(range(0, 7))
grid()
show()


