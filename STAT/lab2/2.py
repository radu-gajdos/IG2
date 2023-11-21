#a
import numpy
import matplotlib.pyplot as plt
fig = plt.figure()
plt.axis("square")
plt.axis((0, 1, 0, 1))
X=numpy.random.random(25)
Y=numpy.random.random(25)
cerc = plt.Circle((0.5, 0.5), radius=0.5, fill=False, color='green')
fig.gca().add_patch(cerc)
count=0
for i in range(25):
    if (X[i]-0.5)**2+(Y[i]-0.5)**2<=0.5**2:
        plt.scatter(X[i],Y[i],color = "red")
        count+=1
    else:
        plt.scatter(X[i],Y[i],color = "black")
plt.show()

#c
import numpy
import matplotlib.pyplot as plt
X=numpy.random.random(2500000)
Y=numpy.random.random(2500000)
count=0
for i in range(2500000):
    if (X[i]-0.5)**2+(Y[i]-0.5)**2<=0.5**2:#math.dist
        count+=1
print("pi")
print(4*count/2500000)