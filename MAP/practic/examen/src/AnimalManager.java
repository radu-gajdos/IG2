import java.awt.*;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;


import static java.util.stream.Collectors.counting;
import static java.util.stream.Collectors.toList;

public class AnimalManager {
    List<Animal> animals = new ArrayList<>();

    public AnimalManager(List<Animal> animals) {
        this.animals = animals;
    }

    public void addAnimalsFromFile(String filename) throws IOException {
        this.animals = Files.readAllLines(Path.of(filename)).stream().map(Animal::parse).collect(Collectors.toList());
    }

//    public void displaySpeciesAndNumber(){
//        System.out.println(this.animals.stream().map(Animal::getSpecies).orderBy());
//    }

    public void WriteSpecificToFile() {
        List<Animal> output = this.animals.stream().filter(animal -> animal.getHealth_status().equals("Sick")).filter(animal -> Character.isUpperCase(animal.getName().charAt(0))).toList();
        try {
            FileWriter fw = new FileWriter("C:\\Users\\Radu\\Desktop\\s2_zoo\\examen\\sick_animals.txt");
            for (Animal animal : output) {
                fw.write(animal.toString());
            }
            System.out.println("Successfully written");
            fw.close();
        } catch (Exception e) {
            e.getStackTrace();
        }
    }

    public int getSpeciesNumber(String species) {
        int s = 0;
        for (Animal animal : animals) {
            if (animal.getSpecies().equals(species)) {
                s += 1;
            }
        }
        return s;
    }

    public void addAnimal(Animal animal) {
        animals.add(animal);
    }

    public void removeAnimal(Animal animal) {
        animals.remove(animal);
    }

    public List<Animal> getAnimals() {
        return animals;
    }

    public void setAnimals(ArrayList<Animal> animals) {
        this.animals = animals;
    }

    @Override
    public String toString() {
        return "AnimalManager{" +
                "animals=" + animals +
                '}';
    }
}
