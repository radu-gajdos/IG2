package org.example;

import java.util.List;

public class Main {
    public static void main(String[] args) {

        List<Employee> employeeList = List.of(new Employee("Bob", 1000),
                new Employee("Dob", 2400),
                new Employee("Zob", 3500));

        try {
            Calculator.employee_statistics(employeeList);
        } catch (InterruptedException ex) {
            System.out.println("Error");
        }

        List<Integer> numbersList = List.of(1, 2, 7, 9, 10, 21, 100, 69, 420, 360, 11, 200, 300);

        try {
            Statistics statistics = new Statistics(numbersList);
            System.out.println(statistics.computeSum());
            System.out.println(statistics.computeMax());
        } catch (InterruptedException e) {
            System.out.println("Error");
        }

    }
}