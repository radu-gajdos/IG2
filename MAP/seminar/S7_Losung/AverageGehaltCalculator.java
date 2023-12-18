package org.example;

import java.util.List;

public class AverageGehaltCalculator extends Thread{

    private List<Employee> employeeList;

    public float getAverageGehalt() {
        return averageGehalt;
    }

    private float averageGehalt;

    public AverageGehaltCalculator(List<Employee> employeeList) {
        this.employeeList = employeeList;
    }

    @Override
    public void run() {
        float sum = 0;

        for(Employee emp : this.employeeList) {
            sum += emp.getGehalt();
        }

        this.averageGehalt = sum / employeeList.size();
    }
}
