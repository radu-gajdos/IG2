public class ForecastDisplay implements Observer,Display{
    private WheaterStation wheaterStation;

    public ForecastDisplay(WheaterStation wheaterStation) {
        this.wheaterStation = wheaterStation;
        this.wheaterStation.registerObserver(this);
    }

    @Override
    public void update() {
        display();
    }

    @Override
    public void display() {
        System.out.println("ForecastDisplay:");
    }
}
