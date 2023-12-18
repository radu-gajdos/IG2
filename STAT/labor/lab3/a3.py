import numpy
from random import randrange
from matplotlib.pyplot import bar, show, hist, grid, legend, xticks

N = 200
daten1 = [randrange(1, 7) for _ in range(N)]
daten2 = [randrange(1, 7) for _ in range(N)]
daten3 = [randrange(1, 7) for _ in range(N)]
sums = [0]*N
for i in range(N):
    sums[i]=daten1[i]+daten2[i]+daten3[i]
z, count = numpy.unique(sums, return_counts=True)
print(z[count==max(count)],max(count))
bar(
    z,
    count / N,
    width=0.9,
    color="red",
    edgecolor="black",
    label="relative Haufigkeiten",
)
alleFaelle=0
alleSums=[]
for i in range(1,7):
    for j in range(1,7):
        for k in range(1,7):
            alleSums.append(i+j+k);
            alleFaelle+=1
x,c = numpy.unique(alleSums, return_counts=True)
print(x[c==max(c)],max(c))
bar(x,c/alleFaelle,width=0.7,color="blue", edgecolor="black", label="theoretische Wahrscheinlichkeit")
legend(loc="lower left")
xticks(range(3, 19))
grid()
show()


