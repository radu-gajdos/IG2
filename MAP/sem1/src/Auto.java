public class Auto {

    private int km;
    private String name;

    public Auto(int km, String name) {
        this.km = km;
        this.name = name;
    }

    @Override
    public String toString() {
        return "Auto{" +
                "km=" + km +
                ", name='" + name + '\'' +
                '}';
    }
}
