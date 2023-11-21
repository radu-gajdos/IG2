public class CurrentConditionDisplay implements Observer,Display{
    private WheaterStation wheaterStation;

    public CurrentConditionDisplay(WheaterStation wheaterStation) {
        this.wheaterStation = wheaterStation;
        this.wheaterStation.registerObserver(this);
    }

    @Override
    public void update() {
        display();
    }

    @Override
    public void display() {
        System.out.println("CurrentConditionDisplay:");
        System.out.println("Temperature: " + wheaterStation.getTemperature() +" , Pressure: " + wheaterStation.getPressure() +" , Humidity: " + wheaterStation.getHumidity() + "\n");
    }
}
