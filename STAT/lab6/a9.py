from itertools import permutations

string = "mutig"

# a)
all_permutations = list(permutations(string))
num_permutations = len(all_permutations)

print("a) Anzahl der Permutationen:", num_permutations)

import random

# b)
random_permutations = random.sample(all_permutations, 2)

print("b) Zufällige Permutationen:", random_permutations)

# c)
variations_four_letters = list(permutations(string, 4))
num_variations_four_letters = len(variations_four_letters)

print("c) Anzahl der Variationen mit vier Buchstaben:", num_variations_four_letters)


from itertools import combinations

# d)
combinations_two_letters = list(combinations(string, 2))
num_combinations_two_letters = len(combinations_two_letters)

print("d) Anzahl der Kombinationen mit zwei Buchstaben:", num_combinations_two_letters)

