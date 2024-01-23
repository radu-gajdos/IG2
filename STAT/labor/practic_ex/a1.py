# A1. Wir spielen Roulette mit einem Einsatz von 5 € mit der Glückszahl 15. Die Wahrscheinlichkeiten und Auszahlungen beim Roulette sind in folgender Tabelle zusammengefasst:
# Ereignis
# Summe
# Wahrscheinlichkeit
# Gewinnen
# 175 €
# 1/38
# Verlieren
# -5 €
# 37/38
# Die Tabelle zeigt, dass, wenn wir gewinnen würden, wir das 35-fache unseres Einsatzes (175 €) zurückbekämen. Die Wahrscheinlichkeit dafür ist allerdings nur 1/38. Wesentlich wahrscheinlicher ist es dagegen, dass wir verlieren, hier -5 € mit einer Wahrscheinlichkeit von 37/38.
# Man führe mehrere solche Situationenfür das Roulettespiel durch und berechne anhand von Simulationen wie viel man im Mittel (durchschnittlich) in 10 Spielen verliert/gewinnt, wenn man immer als Glückszahl die 15 einsetzt.


import numpy as np

# Funktion, um das Ergebnis eines Roulette-Spiels zu simulieren
def roulette_game():
    # Zufällige Zahl zwischen 0 und 37 (37 Möglichkeiten)
    result = np.random.randint(0, 38)
    
    # Wenn die Glückszahl 15 ist und das Ergebnis ebenfalls 15 ist, gewinnen wir 175 €
    if result == 15:
        return 175
    else:
        return -5
    
# Anzahl der Spiele
num_games = 10

# Liste für die Ergebnisse der einzelnen Spiele
results = []

# Simulation der Spiele
for _ in range(num_games):
    results.append(roulette_game())

# Durchschnittlichen Gewinn/Verlust berechnen
average_result = np.mean(results)

print(f"Nach {num_games} Spielen betrug der durchschnittliche Gewinn/Verlust: {average_result} €")
