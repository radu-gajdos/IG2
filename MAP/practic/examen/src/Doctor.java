public class Doctor extends Thread{
    public Animal animal;

    public void setAnimal(Animal animal){
        this.animal=animal;
    }

    @Override
    public void run(){
        if(animal.getHealth_status().equals("Sick"))
            this.animal.setHealth_status("Healing");
        System.out.println("Doctor: Healing animal!");
    }
}
