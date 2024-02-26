import java.util.ArrayList;

public class Animal {
    public String name;
    public String species;
    public String age;
    public String enclosure_type;
    public String health_status;

    public Animal(String name, String species, String age, String enclosure_type, String health_status) {
        this.name = name;
        this.species = species;
        this.age = age;
        this.enclosure_type = enclosure_type;
        this.health_status = health_status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSpecies() {
        return species;
    }

    public void setSpecies(String species) {
        this.species = species;
    }

    public String getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = String.valueOf(age);
    }

    public String getEnclosure_type() {
        return enclosure_type;
    }

    public void setEnclosure_type(String enclosure_type) {
        this.enclosure_type = enclosure_type;
    }

    public String getHealth_status() {
        return health_status;
    }

    public void setHealth_status(String health_status) {
        this.health_status = health_status;
    }

    public static Animal parse(String line){
        String[] attributes = line.split(",");
        return new Animal(attributes[0],attributes[1],attributes[2],attributes[3],attributes[4]);
    }

    @Override
    public String toString() {
        return "Animal{" +
                "name='" + name + '\'' +
                ", species='" + species + '\'' +
                ", age=" + age +
                ", enclosure_type='" + enclosure_type + '\'' +
                ", health_status='" + health_status + '\'' +
                '}'+"\n";
    }
}
