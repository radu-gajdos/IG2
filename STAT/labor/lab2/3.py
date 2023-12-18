import numpy
import matplotlib.pyplot as plt
import math

n = 2500000
X = numpy.random.random(n)
Y = numpy.random.random(n)
count1obtuz = 0
count2obtuz = 0

for i in range(n):
    obtuz1 = False
    point = (X[i], Y[i]) 
    obtuz2 = 0;
    if math.dist(point, (0, 0))**2 + math.dist(point, (0, 1))**2 < 1:
        obtuz1 = True
        obtuz2+=1
    if math.dist(point, (0, 0))**2 + math.dist(point, (1, 0))**2 < 1:
        obtuz1 = True
        obtuz2+=1
    if math.dist(point, (1, 1))**2 + math.dist(point, (0, 1))**2 < 1:
        obtuz1 = True
        obtuz2+=1
    if math.dist(point, (1, 1))**2 + math.dist(point, (1, 0))**2 < 1:
        obtuz1 = True
        obtuz2+=1

    if obtuz1:
        count1obtuz += 1

    if obtuz2==2:
        count1obtuz += 1
print(count1obtuz)
print(count1obtuz / n)
print(count2obtuz / n)