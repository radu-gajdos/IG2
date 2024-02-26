import static org.junit.jupiter.api.Assertions.*;

class AnimalCareTakerProxyTest {

    @org.junit.jupiter.api.Test
    void steal() {
        AnimalCareTacker animalCareTacker = new AnimalCareTacker("cineva",12);
        AnimalCareTakerProxy animalCareTakerProxy = new AnimalCareTakerProxy(animalCareTacker);
        animalCareTakerProxy.steal();
        assert !animalCareTacker.equals(animalCareTakerProxy);
    }
}