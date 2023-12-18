import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.OptionalInt;
import java.util.stream.Collectors;

public class Main {

    public static boolean isPerfectNumber(int num) {
        if (num <= 1) {
            return false;
        }

        int sum = 1;

        for (int i = 2; i <= Math.sqrt(num); i++) {
            if (num % i == 0) {
                sum += i;
                if (i != num / i) {
                    sum += num / i;
                }
            }
        }

        return sum == num;
    }


    public static void main(String[] args) {
        ArrayList<Integer> arrayList = new ArrayList<>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(6);
        arrayList.add(9);

        int sumOfEvenNumbers = arrayList.stream().filter(elem -> elem % 2 == 0).mapToInt(Integer::intValue).sum();

        System.out.println("Summe gerade Zahlen: " + sumOfEvenNumbers);

        int produktQuadrat = arrayList.stream().filter((elem) -> Math.sqrt(Math.floor(elem))*Math.sqrt(Math.floor(elem))==elem).reduce(1, (X,Y)->X*Y);

        System.out.println("Produkt Zahlen^2: " + produktQuadrat);

        OptionalInt maxPerfket = arrayList.stream().filter(Main::isPerfectNumber).mapToInt(Integer::intValue).max();

        System.out.println("Max perketer Zahl: " + maxPerfket);

        ArrayList<Pair<Student, Integer>> studentGrades = new ArrayList<>();

        studentGrades.add(new Pair<>(new Student("John", "A"), 90));
        studentGrades.add(new Pair<>(new Student("Alice", "B"), 95));
        studentGrades.add(new Pair<>(new Student("Bob", "A"), 90));
        studentGrades.add(new Pair<>(new Student("Alice", "B"), 98));
        studentGrades.add(new Pair<>(new Student("Alex", "B"), 98));

        int maxGrade = studentGrades.stream()
                .mapToInt(Pair::getSecond)
                .max()
                .orElse(0);

        List<Student> maxStudents = studentGrades.stream()
                .filter(pair -> pair.getSecond() == maxGrade)
                .map(Pair::getFirst)
                .toList();

        System.out.println("Max Students: " + maxStudents);

        List<Student> studentList = new ArrayList<>();

        studentList.add(new Student("John", "University A"));
        studentList.add(new Student("Alice", "University B"));
        studentList.add(new Student("Bob", "University A"));
        studentList.add(new Student("Alice", "University B"));


        System.out.println(studentList.stream()
                .collect(Collectors.groupingBy(Student::getUniversitat, Collectors.counting())));


        List<Student> studentList2 = new ArrayList<>();


        Student john = new Student("John", "University A");
        john.addCourseGrade("Math", 85);
        john.addCourseGrade("English", 90);

        Student alice = new Student("Alice", "University B");
        alice.addCourseGrade("Math", 92);
        alice.addCourseGrade("English", 88);

        studentList2.add(john);
        studentList2.add(alice);

        Map<String, Double> rezultat = studentList2.stream()
                .flatMap(student -> student.getNoteKurs().stream())
                .collect(Collectors.groupingBy(Pair::getFirst, Collectors.averagingDouble(Pair::getSecond)));

        System.out.println(rezultat);
    }
}
