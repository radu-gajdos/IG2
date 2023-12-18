package p1;

import java.util.ArrayList;

public class AvgGehalt extends Thread {
    private ArrayList<Employee> emps;
    private int result;
    public AvgGehalt(ArrayList<Employee> emps) {
        this.emps = emps;
    }

    @Override
    public void run() {
        int sum = 0;
        for (Employee emp : emps) {
            sum+=emp.getGehalt();
        }
        try {
            sleep(2000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        this.result=sum/emps.size();
        System.out.println("Avg gehalt done...");
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