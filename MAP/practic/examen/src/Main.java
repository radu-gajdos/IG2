import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class Main {
    public static void main(String[] args) throws IOException, InterruptedException {
//        AnimalManager animalManager = new AnimalManager(new ArrayList<>());
//        animalManager.addAnimalsFromFile("C:\\Users\\Radu\\Desktop\\s2_zoo\\examen\\animals_inventory.csv");
//        System.out.println(animalManager);
//
//        animalManager.WriteSpecificToFile();


        //Proxy Pattern
        //folosesc proxy ca sa nu utilizez caretake-erul actual pentru a apela functia steal, ci un proxy
//        AnimalCareTacker animalCareTacker = new AnimalCareTacker("alexandruuu", 12);
//        AnimalCareTakerProxy animalCareTakerProxy = new AnimalCareTakerProxy(animalCareTacker);
//        animalCareTakerProxy.steal();

        List<Integer> l = Stream.of(0, 1, 2)
                .flatMap((i) -> IntStream.range(10 * i, 10 * i + 10).boxed()).toList();

        System.out.println(l);

        List<Integer> list = Stream.of(0, 1, 2,2,1,3).distinct().skip(2).limit(2).toList();

        System.out.println(list);




//        Doctor doctor = new Doctor();
//        Virus virus = new Virus();
//        Animal animal = new Animal("animal", "animal", "15", "Cage", "Sick");
//        doctor.setAnimal(animal);
//        virus.setAnimal(animal);
//        while (true) {
//            doctor.run();
//            virus.run();
//        }


    }
}