import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        ArrayList<String> l1 = new ArrayList<String>();
        l1.add("Patrick Stewart");
        ArrayList<String> l2 = new ArrayList<String>();
        l2.add("Oana");

        Movie StarTrek = new Scifi(l1, 50);
//        Movie HarryPotter = new Scifi((ArrayList<String>) List.of("Andrei"), 100);
        Movie Maiculita = new Horror(l2, 100);
//        Movie AS = new Comedy((ArrayList<String>) List.of("Adam Sandler"), 100);
//        Movie ASDASDAS = new Comedy((ArrayList<String>) List.of("altcineva"), 100);

        OrderLine o1 = new OrderLine(StarTrek,2);
//        OrderLine o2 = new OrderLine(HarryPotter,10);
        OrderLine o3 = new OrderLine(Maiculita,1);
//        OrderLine o4 = new OrderLine(AS,1);
//        OrderLine o5 = new OrderLine(ASDASDAS,10);

        System.out.println(o1.calculatePrice());
        System.out.println(o3.calculatePrice());
    }
}

interface Movie {
    ArrayList<String> getActors();

    double calculatePrice();
}

class Scifi implements Movie {
    public ArrayList<String> actors;
    public int price;

    public Scifi(ArrayList<String> actors, int price) {
        this.actors = actors;
        this.price = price;
    }

    @Override
    public ArrayList<String> getActors() {
        return actors;
    }

    @Override
    public double calculatePrice() {
        return this.price;
    }
}

class Horror implements Movie {
    public ArrayList<String> actors;
    public int price;

    public Horror(ArrayList<String> actors, int price) {
        this.actors = actors;
        this.price = price;
    }

    @Override
    public ArrayList<String> getActors() {
        return actors;
    }

    @Override
    public double calculatePrice() {
        return this.price * 0.9;
    }
}

class Comedy implements Movie {
    public ArrayList<String> actors;
    public int price;

    public Comedy(ArrayList<String> actors, int price) {
        this.actors = actors;
        this.price = price;
    }

    @Override
    public ArrayList<String> getActors() {
        return actors;
    }

    @Override
    public double calculatePrice() {
        if (this.actors.contains("Adam Sandler")) {
            return this.price * 0.5;
        }
        return this.price;
    }
}

class OrderLine{
    public Movie movie;
    public int quantity;

    public OrderLine(Movie movie, int quantity) {
        this.movie = movie;
        this.quantity = quantity;
    }

    public double calculatePrice(){
        return quantity *movie.calculatePrice();
    }

}
