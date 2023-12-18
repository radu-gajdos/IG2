import numpy as np

anzahl_rote_kugeln = 20
anzahl_blaue_kugeln = 15
anzahl_gruene_kugeln = 5
anzahl_schwarze_kugeln = 10

gesamtanzahl_kugeln = anzahl_rote_kugeln + anzahl_blaue_kugeln + anzahl_gruene_kugeln + anzahl_schwarze_kugeln

N = 1000

ziehungen = np.random.choice(['rot', 'blau', 'gruen', 'schwarz'], size=(N, 10),
                              p=[anzahl_rote_kugeln/gesamtanzahl_kugeln,
                                 anzahl_blaue_kugeln/gesamtanzahl_kugeln,
                                 anzahl_gruene_kugeln/gesamtanzahl_kugeln,
                                 anzahl_schwarze_kugeln/gesamtanzahl_kugeln])

print("Ergebnisse 10 Ziehungen:")
print(ziehungen[:10, :])



print("\nTheoretische relative Häufigkeiten:")
print("Rot:", anzahl_rote_kugeln / gesamtanzahl_kugeln)
print("Blau:", anzahl_blaue_kugeln / gesamtanzahl_kugeln)
print("Grün:", anzahl_gruene_kugeln / gesamtanzahl_kugeln)
print("Schwarz:", anzahl_schwarze_kugeln / gesamtanzahl_kugeln)

#relative Häufigkeit
relative_haeufigkeit_rot = np.sum(ziehungen == 'rot') / (N * 10)
relative_haeufigkeit_blau = np.sum(ziehungen == 'blau') / (N * 10)
relative_haeufigkeit_gruen = np.sum(ziehungen == 'gruen') / (N * 10)
relative_haeufigkeit_schwarz = np.sum(ziehungen == 'schwarz') / (N * 10)

print("\nSimulierte relative Häufigkeiten (nach", N, "Ziehungen):")
print("Rot:", relative_haeufigkeit_rot)
print("Blau:", relative_haeufigkeit_blau)
print("Grün:", relative_haeufigkeit_gruen)
print("Schwarz:", relative_haeufigkeit_schwarz)
