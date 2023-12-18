package p2;

public class Problem2 {
    public static void main(String[] args) {
        Deck deck = new Deck();
        for (int i = 1; i <= 13; i++) {
            for (Colors c : Colors.values()) {
                Spielkarte k = new Spielkarte(c, i);
                deck.insertSpielkarte(k);
            }
        }
        System.out.println(deck);
    }
}