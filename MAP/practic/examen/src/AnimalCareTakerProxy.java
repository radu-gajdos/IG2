public class AnimalCareTakerProxy extends AnimalCareTacker{
    public String name;
    public int age;

    public AnimalCareTakerProxy(AnimalCareTacker animalCareTacker) {
        super(animalCareTacker.getName(),animalCareTacker.getAge());
        this.name="---";
        this.age=0;
    }

    public void steal(){
        System.out.println("Animal stolen!!!");
    }
}
