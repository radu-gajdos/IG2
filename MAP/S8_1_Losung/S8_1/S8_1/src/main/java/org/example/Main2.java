package org.example;

import java.util.List;

public class Main2 {

    public static void main(String[] args) {

        int limit = 100000;
        SharedCounter sharedCounter = new SharedCounter(limit);

        Thread thread1 = new Thread(() -> sharedCounter.increment());
        Thread thread2 = new Thread(() -> sharedCounter.increment());

        thread1.start();
        thread2.start();

        try {
            thread1.join();
            thread2.join();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

        System.out.println("Final counter: " + sharedCounter.getCurrentValue());
    }
}
