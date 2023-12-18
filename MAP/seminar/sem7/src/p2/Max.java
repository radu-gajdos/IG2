package p2;

import java.util.ArrayList;

import static java.lang.Thread.sleep;

public class Max implements Runnable {
    private ArrayList<Integer> numbers;
    private int result;

    private int start;
    private int end;

    public Max(ArrayList<Integer> numbers, int start, int end) {
        this.numbers = numbers;
        this.start = start;
        this.end = end;
    }

    @Override
    public void run(){
        int max = 0;
        for(int i=start;i<end;i++){
            if(numbers.get(i)>max){
                max= numbers.get(i);
            }
        }
        try {
            sleep(2000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        this.result=max;
    }

    public ArrayList<Integer> getNumbers() {
        return numbers;
    }

    public void setNumbers(ArrayList<Integer> numbers) {
        this.numbers = numbers;
    }

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }
}
