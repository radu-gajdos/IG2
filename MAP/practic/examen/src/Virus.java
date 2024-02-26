public class Virus extends Thread{
    public Animal animal;

    public void setAnimal(Animal animal){
        this.animal=animal;
    }

    @Override
    public void run(){
        if(animal.getHealth_status().equals("Healing")) {
            System.out.println("Virus: Waiting 2sec...");
            try {
                sleep(2000);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            this.animal.setHealth_status("Sick");
        }
        System.out.println("Virus: Made animal sick!");
    }
}
