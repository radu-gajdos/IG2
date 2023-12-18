package org.example;

import java.util.LinkedList;
import java.util.List;

public class Main {

    private static final int NUMBER_THREADS = 4;

    public static void main(String[] args) throws InterruptedException {

        ParallelQueue inputQueue = new ParallelQueue();
        ParallelQueue outputQueue = new ParallelQueue();

        Thread thread1 = new Thread(() -> {
            for (int i = 0; i < 50; i++)
                inputQueue.enqueue(i);
        });

        thread1.start();
        thread1.join();

        List<Thread> inputThreads = new LinkedList<>();

        for (int i = 0; i < NUMBER_THREADS; i++) {
            inputThreads.add(new Thread(() -> {
                    while (!inputQueue.isEmpty()) {
                        int number = 0;
                        try {
                            number = inputQueue.deque();
                        } catch (InterruptedException e) {
                            throw new RuntimeException(e);
                        }
                        //synchronized (outputQueue) {
                        outputQueue.enqueue(number);
                        //}}
                }
            }));
        }

        Thread resultThread = new Thread(() -> {
            while (!outputQueue.isEmpty() || !inputQueue.isEmpty()) {
                try {
                    int number = outputQueue.deque();
                    System.out.println("Thread element dequeued: " + number);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
            }
        });

        resultThread.start();

        for (int i = 0; i < NUMBER_THREADS; i++) {
            inputThreads.get(i).start();
        }


    }
}
