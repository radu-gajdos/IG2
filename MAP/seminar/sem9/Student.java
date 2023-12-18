import java.util.ArrayList;
import java.util.List;

public class Student {
    private String name;
    private String universitat;
    private List<Pair<String, Integer>> noteKurs;

    public Student(String name, String universitat) {
        this.name = name;
        this.universitat = universitat;
        this.noteKurs = new ArrayList<>();
    }

    public void addCourseGrade(String kurs, int note) {
        noteKurs.add(new Pair<>(kurs, note));
    }

    public List<Pair<String, Integer>> getNoteKurs() {
        return noteKurs;
    }

    public void setNoteKurs(List<Pair<String, Integer>> noteKurs) {
        this.noteKurs = noteKurs;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUniversitat() {
        return universitat;
    }

    public void setUniversitat(String universitat) {
        this.universitat = universitat;
    }

    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", universitat='" + universitat + '\'' +
                '}';
    }

}
