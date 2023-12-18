package p1;

import java.util.ArrayList;

public class Calculator {
    public void employee_statistics(ArrayList<Employee> emps) throws InterruptedException {
        MaxGehalt maxGehalt = new MaxGehalt(emps);
        AvgGehalt avgGehalt = new AvgGehalt(emps);
        maxGehalt.start();
        avgGehalt.start();
        System.out.println("Done...");
        maxGehalt.join();
        System.out.println("Max gehalt thread done");
        avgGehalt.join();
        System.out.println("Avf gehalt thread done");
        System.out.println("Max gehalt result: "+ maxGehalt.getResult());
        System.out.println("Avg gehalt result: "+ avgGehalt.getResult());
    }
}