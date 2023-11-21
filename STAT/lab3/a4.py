import random
import numpy

c1, c2, a1, a2 = 0, 0, 0, 0
N = 1000
A = list(range(1, 21))
for _ in range(N):
    i = numpy.random.randint(len(A))
    v = A[i]
    c1 = c1 + (v%2)
    c2 = c2 + ((v%2) == 0)
    a1 = a1 + (v%2) * ((v%3) == 0)
    a2 = a2 + ((v%2) == 0) * (6<=v and v<=10)
p1 = a1 / c1 #divizibil 3 si impar / impar => Zahl teilbar durch 3 wenn man weiss die Zahl ist ungerade
p2 = a2 / c2 #pare si intre 6 si 10 / pare => Zahl zwischen 6 u. 10 wenn man weiss die Zahl ist gerade
p3 = c1 / N # impar / toate => Wkt Zahl ist ungerade
print("Aus den Simulationen :")
print(f"p1={p1:.6f}" + " Th: " + str(3/10))
print(f"p2={p2:.6f}" + " Th: " + str(3/10))
print(f"p3={p3:.6f}" + " Th: " + str(10/20))
#p1 3/10
#p2 3/10
#p3 10/20