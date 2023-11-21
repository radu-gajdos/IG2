from scipy.stats import binom
import numpy
from matplotlib.pyplot import bar, show, hist, grid, legend, xticks

N=1000
n=8; p= 0.5
X = binom.rvs(n, p, size= N)
print("zufallige Werte fur X:")
print(X)
w=binom.pmf(5,n,p)  
print("P( X =",5,f")={w:.6f}")

z, count = numpy.unique(X, return_counts=True)
d = dict([(z[i], count[i] / N) for i in range(0, len(z))])

bar(
    z,
    count / N,
    width=0.9,
    color="red",
    edgecolor="black",
    label=" relative Haufigkeiten ",
)

D = {k: binom.pmf(k, n, p) for k in range(0, n + 1)};

bar(
    D.keys(),
    D.values(),
    width=0.9,
    color="blue",
    edgecolor="black",
    label=" theoretische Haufigkeiten ",
)

legend(loc="upper right")
xticks(range(0, 8))
grid()
show()
