package org.example;

import java.util.List;

public class MaxGehaltCalculator extends Thread{

    private List<Employee> employeeList;
    private int maxGehalt;

    public MaxGehaltCalculator(List<Employee> employeeList) {
        this.employeeList = employeeList;
    }

    public int getMaxGehalt() {
        return maxGehalt;
    }

    @Override
    public void run() {
        int max = 0;
        for(Employee emp: this.employeeList) {
            if(emp.getGehalt() > max) {
                max = emp.getGehalt();
            }
        }
        this.maxGehalt = max;
    }
}
