package org.example;

public class Employee {

    private String Name;
    private int Gehalt;

    public Employee(String name, int gehalt) {
        Name = name;
        Gehalt = gehalt;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public int getGehalt() {
        return Gehalt;
    }

    public void setGehalt(int gehalt) {
        Gehalt = gehalt;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "Name='" + Name + '\'' +
                ", Gehalt=" + Gehalt +
                '}';
    }
}
