# A17. Einer von zwei Kandidaten (A und B) soll als Bürgermeister einer Stadt gewählt werden. Es ist bekannt
# dass Kandidat A 46% Chancen hat. Man simuliere Daten, die als Ergebnisse einer Umfrage Sind, an der 500
# Bürger einer Stadt befragt werden. Man schätze die Wahrscheinlichkeit, dass anhand der Daten mehr als 235
# Bürger Kandidat A wählen möchten.

import numpy as np

N = 2000

prob_candidate_A_win = 0.46


votes_won_A = 0
votes_won_B = 0

for _ in range(N):
    result = np.random.binomial(1, prob_candidate_A_win, 1)
    if result==1:
        votes_won_A+=1
    else:
        votes_won_B+=1

print("Probability of candidate A winning: ", votes_won_A/N)
print("Probability of candidate B winning: ", votes_won_B/N)

