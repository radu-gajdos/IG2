package p1;

public class Spielkarte {
    private String farbe;
    private int wert;

    public Spielkarte(String farbe, int wert) {
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