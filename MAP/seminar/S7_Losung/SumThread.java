package org.example;

import java.util.List;

public class SumThread extends Thread{

    private List<Integer> numbersList;

    private int result;
    private int start, end, sum;

    public SumThread(List<Integer> numbersList, int start, int end) {
        this.numbersList = numbersList;
        this.start = start;
        this.end = end;
    }

    @Override
    public void run() {

        for(int i = start ; i < end; i ++) {
            sum += numbersList.get(i);
        }
    }

    public int getSum() {
        return sum;
    }
}
