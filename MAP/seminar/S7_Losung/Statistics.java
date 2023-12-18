package org.example;

import javax.swing.plaf.basic.BasicInternalFrameTitlePane;
import java.util.ArrayList;
import java.util.List;

public class Statistics {

    private List<Integer> numbersList;
    private final int NR_THREADS = 4;
    private int chunkSize = 0;

    private int start, end;


    public Statistics(List<Integer> numbersList) {
        this.numbersList = numbersList;
    }

//    public int computeSum() {
//        int numThreads = 4;
//        int chunkSize = numbersList.size() / numThreads;
//        SumThread[] threads = new SumThread[numThreads];
//
//        for (int i = 0; i < numThreads; i++) {
//            int start = i * chunkSize;
//            int end = (i == numThreads - 1) ? numbersList.size() : (i + 1) * chunkSize;
//            threads[i] = new SumThread(numbersList, start, end);
//            threads[i].start();
//        }
//
//        int totalSum = 0;
//        for (int i = 0; i < numThreads; i++) {
//            try {
//                threads[i].join();
//                totalSum += threads[i].getSum();
//            } catch (InterruptedException e) {
//                e.printStackTrace();
//            }
//        }
//
//        return totalSum;
//    }

    public int computeSum() throws InterruptedException {

        List<Thread> sumThreads = new ArrayList<>();

        int sum = 0;

        int chunkSize = numbersList.size() / NR_THREADS;
        for(int i = 0; i < NR_THREADS; i++) {
            start = i * chunkSize;
            end = (i + 1) * chunkSize;
            if(end > numbersList.size())
                end = numbersList.size();
            sumThreads.add(new SumThread(this.numbersList, start, end));
        }

        for(int i = 0; i < NR_THREADS; i++) {
            sumThreads.get(i).start();
        }

        for(int i = 0; i < NR_THREADS; i++) {
            sumThreads.get(i).join();
        }

        for(int i = 0; i < NR_THREADS; i++) {
            sum += ((SumThread) sumThreads.get(i)).getSum();
        }

        return sum;
    }

    public int computeMax() throws InterruptedException {

        List<Thread> maxThreads = new ArrayList<>();

        int max = 0;


        int chunkSize = numbersList.size()  / NR_THREADS;
        for(int i = 0; i < NR_THREADS; i++) {
            start = i * chunkSize;
            end = (i + 1) * chunkSize;
            System.out.println(start);

            System.out.println(end);
//            if(end > numbersList.size())
//                end = numbersList.size();
            if ( i == NR_THREADS - 1) {
                end = numbersList.size();
            }
            maxThreads.add(new MaxThread(this.numbersList, start, end));
        }

        for(int i = 0; i < NR_THREADS; i++) {
            maxThreads.get(i).start();
        }

        for(int i = 0; i < NR_THREADS; i++) {
            maxThreads.get(i).join();
        }

        for(int i = 0; i < NR_THREADS; i++) {
            max = Math.max(max, ((MaxThread)maxThreads.get(i)).getMax());
        }

        return max;
    }


}

