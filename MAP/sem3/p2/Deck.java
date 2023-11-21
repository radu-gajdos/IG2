package p2;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.function.Consumer;


public class Deck implements Iterable{

    private final ArrayList<Spielkarte> karten = new ArrayList<Spielkarte>();

    public Iterator iterator(){
        return new DeckIterator(this);
    }

    @Override
    public String toString() {
        String returnMessage = "";
        for(Spielkarte k : karten){
            returnMessage=returnMessage+k.toString()+"\n";
        }
        return returnMessage;
    }

    public void insertSpielkarte(Spielkarte s){
        karten.add(s);
    }

    public ArrayList<Spielkarte> getKarten(){
        return this.karten;
    }

    public Spielkarte getSpielkarteAtIndex(int index){
        return karten.get(index);
    }
}

class DeckIterator implements  Iterator{

    int index;
    Deck deck;
    public DeckIterator(Deck obj){
        index=0;
        deck=obj;
    }

    @Override
    public boolean hasNext() {
        return index<this.deck.getKarten().size();
    }

    @Override
    public Spielkarte next() {
        if(hasNext()){
            Spielkarte karte = deck.getSpielkarteAtIndex(index);
            index++;
            return karte;
        }
        else throw  new NoSuchElementException();
    }

    @Override
    public void remove() {
        Iterator.super.remove();
    }

    @Override
    public void forEachRemaining(Consumer action) {
        Iterator.super.forEachRemaining(action);
    }
}