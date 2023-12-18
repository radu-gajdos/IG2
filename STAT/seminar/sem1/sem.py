#Permutationen
import more_itertools
from more_itertools import distinct_permutations
for p in distinct_permutations ("AABB"):
    print ("". join (p))

#Combinationen
import math
from math import comb
import itertools
from itertools import combinations
print (" alle Kombinationenen aus DEFGH je 3")
for p in combinations ("DEFGH",3):
    print ("". join (p))
print (" Wert Kombination C_5^3:", comb (5,3))    

import itertools
from itertools import combinations_with_replacement
for p in combinations_with_replacement ("ABC",5):
    print ("". join (p))

#Variationen
import itertools
from itertools import combinations_with_replacement
import more_itertools
from more_itertools import distinct_permutations
c=0
print (" Alle Variationen von ABC je 2 mit Wiederholung :")
for p in combinations_with_replacement ("ABC",2):
    for t in distinct_permutations (p):
        print ("". join (t))
        c=c+1
print (" Anzahl Variationen von ABC je 2 mit Wiederholung :",c)