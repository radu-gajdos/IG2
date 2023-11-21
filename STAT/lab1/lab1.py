import random
from random import sample
import math
from math import factorial, perm, comb
import itertools
from itertools import permutations, combinations
# help("random.sample")
# help("math.perm")
# help("itertools.permutations")
print(perm(4,4))
print(perm(4,2))
#help("math.comb")
#2.a Man erstelle eine Liste mit den Permutationen von ABC.
print(list(permutations("ABC")))
#2.b Welches ist die gesamte Anzahl der Permutationen von ABC? (3 de cate 3)
print(perm(3,3))
#2.c Man generiere eine zuf¨allige Permutation von MATHE.
print(sample("MATHE", len("MATHE")))
print(sample("MATHE", 3))