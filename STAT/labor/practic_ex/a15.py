# A 15. Man würfelt mit einem Würfel so lange bis das erste Mal die 6 auftaucht.
# Anhand von Simulationen schätze man: wie oft muss man im Mittel (durchschnittlich)
# würfeln bevor erstmals die 6 auftaucht?

import numpy as np

# Anzahl der Simulationen
N = 10000000

# Liste für die durchschnittlichen Anzahlen der Würfe
durchschnittliche_anzahl_wuerfe_liste = []

# Durchführe die Simulationen
for _ in range(N):
    wurfe_bis_erste_sechs = 0
    while np.random.randint(1, 7) != 6:
        wurfe_bis_erste_sechs += 1
    durchschnittliche_anzahl_wuerfe_liste.append(wurfe_bis_erste_sechs + 1)

# Berechne die durchschnittliche Anzahl der Würfe über alle Simulationen
durchschnittliche_anzahl_wuerfe = np.mean(durchschnittliche_anzahl_wuerfe_liste)

print(f"Die geschätzte durchschnittliche Anzahl der Würfe bis zur ersten 6 ist: {durchschnittliche_anzahl_wuerfe:.2f}")
