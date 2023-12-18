package p1;

import java.util.ArrayList;

public class MaxGehalt extends Thread {
    private ArrayList<Employee> emps;

    private int result;

    public MaxGehalt(ArrayList<Employee> emps) {
        this.emps = emps;
    }

    @Override
    public void run() {
        int max_gehalt = Integer.MIN_VALUE;
        for (Employee emp : emps) {
            if (emp.getGehalt() > max_gehalt) {
                max_gehalt = emp.getGehalt();
            }
        }
        try {
            sleep(2000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        this.result = max_gehalt;
        System.out.println("Max gehalt done...");
    }

    public ArrayList<Employee> getEmps() {
        return emps;
    }

    public void setEmps(ArrayList<Employee> emps) {
        this.emps = emps;
    }

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }
}