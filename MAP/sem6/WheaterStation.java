import java.util.ArrayList;
import java.util.List;

public class WheaterStation implements Observable{
    public int temperature;
    public int pressure;
    public double humidity;
    List<Observer> observers;

    public WheaterStation(){
        this.observers=new ArrayList<>();
    }
    public WheaterStation(int temperature, int pressure, double humidity, List<Observer> observers) {
        this.temperature = temperature;
        this.pressure = pressure;
        this.humidity = humidity;
        this.observers = observers;
    }

    public void setMeasurements(int temperature, int pressure, double humidity){
        this.temperature=temperature;
        this.pressure=pressure;
        this.humidity=humidity;
        notifica();
    }

    public int getTemperature() {
        return temperature;
    }

    public int getPressure() {
        return pressure;
    }

    public double getHumidity() {
        return humidity;
    }

    public List<Observer> getObservers() {
        return observers;
    }

    public void setTemperature(int temperature) {
        this.temperature = temperature;
    }

    public void setPressure(int pressure) {
        this.pressure = pressure;
    }

    public void setHumidity(double humidity) {
        this.humidity = humidity;
    }

    public void setObservers(List<Observer> observers) {
        this.observers = observers;
    }

    @Override
    public void registerObserver(Observer observer) {
        observers.add(observer);
    }

    @Override
    public boolean removeObserver(Observer observer) {
        return observers.remove(observer);
    }

    @Override
    public void notifica(){
        for(Observer observer : observers){
            observer.update();
        }
    }
}
