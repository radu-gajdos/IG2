import numpy
from random import randrange
from matplotlib.pyplot import bar, show, hist, grid, legend, xticks

N = 1000
x = [0, 1, 2, 3, 4]
P = [0.25, 0.35, 0.25, 0.1, 0.05]
rng = numpy.random.default_rng()
r = rng.choice(x, size=N, replace=True, p=P)

z, count = numpy.unique(r, return_counts=True)
d = dict([(z[i], count[i] / N) for i in range(0, 5)])
anzahlMinEinz = count[0] + count[1]
print(anzahlMinEinz / N)
print(numpy.mean(r))
sum = 0
for i in range(len(x)):
    sum += x[i] * P[i]
print(sum)
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
legend(loc="upper right")
xticks(range(0, 7))
grid()
show()
