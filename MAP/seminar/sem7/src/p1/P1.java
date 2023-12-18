package p1;

import java.util.ArrayList;

public class P1 {
    public static void main(String[] args) throws InterruptedException {
        ArrayList<Employee> emps = new ArrayList<>();
        Employee emp1 = new Employee("Anrei", 2000);
        Employee emp2 = new Employee("Alex", 1500);
        Employee emp3 = new Employee("Odobasian", 2200);
        emps.add(emp1);
        emps.add(emp2);
        emps.add(emp3);
        Calculator calculator = new Calculator();
        calculator.employee_statistics((emps));
    }
}