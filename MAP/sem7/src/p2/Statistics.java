package p2;

import java.util.ArrayList;

public class Statistics {

    private Sum sumClass;
    private Max maxClass;

    private ArrayList<Integer> numbers = new ArrayList<>();

    public Statistics(ArrayList<Integer> numbers) {
        this.numbers = numbers;
        Sum sumClass = new Sum(this.numbers, 0, 2);
        Max maxClass = new Max(this.numbers,0,2);
    }

    public void calculate() throws InterruptedException {
        Thread sum = new Thread(sumClass);
        Thread max = new Thread(maxClass);
        sum.start();
        max.start();
        sum.join();
        max.join();
    }

    public ArrayList<Integer> getNumbers() {
        return numbers;
    }

    public void setNumbers(ArrayList<Integer> numbers) {
        this.numbers = numbers;
    }
}
