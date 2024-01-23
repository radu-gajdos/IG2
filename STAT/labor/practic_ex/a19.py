# A 19. Bei einem Tenniswettbewerb gewinnt Spieler A in jedem Spiel mit einer Wahrscheinlichkeit von 600 0
# gegen Spieler B. Der Spieler, der als erster 3 Spiele gewonnen hat, hat auch den Wettbewerb gewonnen. Man
# schätze anhand von N=2000 Simulationen die Gewinnwahrscheinlichkeiten des Wettbewerbs für Spieler A bzw.
# Spieler B.
# (zB: BAABA A hat gewonnen nach 5 Spielen; ABBAB B hat gewonnen nach 5 Spielen; ABBB —i B hat
# gewonnen nach 4 Spielen; BBB B hat gewonnen nach 3 Spielen usw.)

import numpy as np

N = 2000

prob_player_A_win = 0.60
prob_player_B_win = 0.40

matches_won_A = 0
matches_won_B = 0

for _ in range(N):
    score_A=0
    score_B=0
    while score_A<4 and score_B<4:
        result = np.random.binomial(1, prob_player_A_win, 1)
        if result==1:
            score_A+=1
        else:
            score_B+=1
    if score_A>score_B:
        matches_won_A+=1
    else:
        matches_won_B+=1

print("Probability of Player A winning: ", matches_won_A/N)
print("Probability of Player B winning: ", matches_won_B/N)

