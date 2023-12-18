# In einer Urne sind 6 rote Kugeln, 4 blaue Kugeln und 6 grune Kugeln. Man zieht 3 Kugeln
# hintereinander ohne Zurucklegen. Man betrachtet die Ereignisse:
# A:\mindestens eine rote Kugel wurde entnommen"
# B:\alle entnommenen Kugeln haben dieselbe Farbe".
# eine Simulation des Experiments Aufgabe A1:
import random
k=1000000
sumRot=0
sumAlle=0
sumAlleRot=0
for i in range(k):
    kugeln = random . sample (['r','b','g'],counts =[6,4,6],k=3)
    if("r" in kugeln):
        sumRot+=1
    if(kugeln==['r','r','r'] or kugeln ==['b','b','b'] or kugeln ==['g','g','g']):
        sumAlle+=1
    if(kugeln==['r','r','r']):
        sumAlleRot+=1
#wenigstens eine rote kugeln
wer= sumRot/k
print("Wenigstens eine rot: " + str(wer))
print("Theoretisch: " + str(1-(10/16 * 9/15 * 8/14)))
#alle die selbe farbe
print("Wenigstens eine rot: " + str(sumAlle/k));
print("Theoretisch: " + str(2*(6/16 * 5/15 * 4/14)+(4/16 * 3/15 * 2/13)))
#alle rot
ar = sumAlleRot/k
print("Alle rot: " + str(ar));
print("Theoretisch"+str(6/16 * 5/15 * 4/14))
#alle rot/wenigstens eine rot
print(ar/wer)
print("Theoretisch"+str((6/16 * 5/15 * 4/14)/(1-(10/16 * 9/15 * 8/14))))

