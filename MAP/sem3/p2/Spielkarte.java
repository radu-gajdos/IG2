package p2;

public class Spielkarte {
    private Colors farbe;
    private int wert;

    public Spielkarte(Colors farbe, int wert) {
        this.farbe = farbe;
        this.wert = wert;
    }

    @Override
    public String toString() {
        return "Spielkarte{" +
                "farbe='" + farbe + '\'' +
                ", wert=" + wert +
                '}';
    }
}