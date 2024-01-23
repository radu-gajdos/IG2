# All. In einer Urne befinden Sich 6 rote, 4 weiße und 10 blaue Kugeln. Es werden vier Kugeln gezogen. Wie groß
# ist die Wahrscheinlichkeit, die Kugeln in der Reihenfolge „rot, weiß, blau, blau" zu ziehen, wenn die Kugeln nach
# der Ziehung
# a) zufiickgelegt b) nicht zurückgelegt werden?
# Man beantworte die Fragen anhand von Simulationen; welche sind die entsprechenden theoretischen
# Wahrscheinlichkeiten?

import numpy as np

# Anzahl der Simulationen
N = 100000

# Anzahl der Kugeln
red_balls = 6
white_balls = 4
blue_balls = 10

# Simuliere N Ziehungen mit Zurücklegen
draws_with_replacement = np.random.choice(['red', 'white', 'blue'], size=(N, 4), replace=True)

# Zähle die Ereignisse "rot, weiß, blau, blau"
count_events_with_replacement = np.sum(np.all(draws_with_replacement == ['red', 'white', 'blue', 'blue'], axis=1))

# Schätze die Wahrscheinlichkeit durch Zählen der Ereignisse
estimated_probability_with_replacement = count_events_with_replacement / N
print(f"Estimated probability with replacement: {estimated_probability_with_replacement:.4f}")


# Simuliere N Ziehungen ohne Zurücklegen
draws_without_replacement = np.random.choice(['red', 'white', 'blue'], size=(N, 4), replace=False)

# Zähle die Ereignisse "rot, weiß, blau, blau"
count_events_without_replacement = np.sum(np.all(draws_without_replacement == ['red', 'white', 'blue', 'blue'], axis=1))

# Schätze die Wahrscheinlichkeit durch Zählen der Ereignisse
estimated_probability_without_replacement = count_events_without_replacement / N
print(f"Estimated probability without replacement: {estimated_probability_without_replacement:.4f}")
