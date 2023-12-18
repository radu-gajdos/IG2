package org.example;

import java.util.LinkedList;
import java.util.Queue;

public class ParallelQueue {

    private Queue<Integer> queue;

    public ParallelQueue() {
        this.queue = new LinkedList<>();
    }

    public synchronized boolean isEmpty() {
        return queue.isEmpty();
    }

    public synchronized void enqueue(int element) {
        queue.add(element);
//        System.out.println(element);
        notify();
    }

    synchronized public int deque() throws InterruptedException {
        while (queue.isEmpty()) {
            wait();
        }
        return queue.poll();
    }
}
