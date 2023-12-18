package p2;

import java.util.ArrayList;

public class P2 {
    public static void main(String[] args) throws InterruptedException {
        ArrayList<Integer> numbers = new ArrayList<>();
        numbers.add(1);
        numbers.add(4);
        numbers.add(2);
        numbers.add(10);
        Statistics statistics = new Statistics(numbers);
        statistics.calculate();
    }
}