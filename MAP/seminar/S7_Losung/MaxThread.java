package org.example;

import java.util.List;

public class MaxThread extends Thread {

    private List<Integer> numbersList;

    private int start, end, max = 0;

    public MaxThread(List<Integer> numbersList, int start, int end) {
        this.numbersList = numbersList;
        this.start = start;
        this.end = end;
    }

    public int getMax() {
        return max;
    }

    @Override
    public void run() {

        for(int i = start ; i < end; i ++)
            if(numbersList.get(i) > max) {
                max = numbersList.get(i);
            }
    }


}
