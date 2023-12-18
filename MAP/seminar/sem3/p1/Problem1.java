package p1;

public class Problem1 {
    public static void main(String[] args) {
        Deck deck = new Deck();
        for (int i = 1; i <= 13; i++) {
            String[] colors = {"Pix", "Kreuz", "Herz", "Krao"};
            for (String c : colors) {
                Spielkarte k = new Spielkarte(c, i);
                deck.insertSpielkarte(k);
            }
        }
        System.out.println(deck);
    }
}