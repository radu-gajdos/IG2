public interface Observer
{
    public void update();
}

public interface Observeable{
    public void update(Observer observer);
    public void notifyAll();
}

public class ActualObserver : Observer{
    
    string mesaj;
    
    ActualObserver(string mesaj){
        this.mesaj = mesaj;
    }

    public void update(){
        Console.writeLine(this.mesaj);
    }
}

public class ActualObserveable : Observeable{
    private List<Observer observer> observers= new List<Observer>;

    public void update(Observer observer){
        this.observers.Add(observer);
    }

    // public void notifyAll(){
    //     foreach (Observer observer in observers)
    //     {
    //         observer.update()
    //     }
    // }
}

public class ObserveableWithDelegate{
    public event UpdateMethod handler;
}