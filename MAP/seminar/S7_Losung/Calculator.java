package org.example;

import java.util.List;

public class Calculator {

    public static void employee_statistics(List<Employee> employeeList) throws InterruptedException {

        Thread maxGehaltCalculator = new MaxGehaltCalculator(employeeList);
        Thread averageGehaltCalculator = new AverageGehaltCalculator(employeeList);

        maxGehaltCalculator.start();
        averageGehaltCalculator.start();

        maxGehaltCalculator.join();
        averageGehaltCalculator.join();

        System.out.println(((MaxGehaltCalculator) maxGehaltCalculator).getMaxGehalt());
        System.out.println(((AverageGehaltCalculator) averageGehaltCalculator).getAverageGehalt());
    }


}
