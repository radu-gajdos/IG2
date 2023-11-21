import numpy
iterationen=1
count=0
n=1000000
while iterationen<n:
    v = numpy.random.randint(1,366,23)
    s = set(v)
    if len(s)<23:
        count+=1
    iterationen+=1
print("Simulierte warscheinlichkeit")
print(count/n)

dif=1;
for i in range(23):
    dif*=(365-i)/365
print("Theoretische warscheinlichkeit")
print(1-dif)

#beispiel
import numpy
from matplotlib.pyplot import axis,plot,figure,show,legend
fig = figure()
axis("square")
axis((0, 1, 0, 1))
X=numpy.random.random(25)
Y=numpy.random.random(25)
plot(X,Y,"bo")
fig.suptitle("Beispiel 1 ",fontweight ="bold")
show()
fig = figure()
axis("square")
axis((0, 1, 0, 1))
plot(X,numpy.square(X),"g*") # zufallige Punkte auf dem Bild der Funktion F(x)=xˆ2
plot(X,numpy.power(X,4),"mo") # zufallige Punkte auf dem Bild der Funktion F(x)=xˆ4
plot(X[-1],numpy.square(X[-1]),"g*",label="xˆ2")
plot(X[-1],numpy.power(X[-1],4),"mo",label="xˆ4")
legend(loc="upper left")
fig.suptitle("Beispiel 2 ",fontweight ="bold")
show()