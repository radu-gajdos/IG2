public class StatisticDisplay implements Observer,Display{
    private WheaterStation wheaterStation;

    public StatisticDisplay(WheaterStation wheaterStation) {
        this.wheaterStation = wheaterStation;
        this.wheaterStation.registerObserver(this);
    }

    @Override
    public void update() {
        display();
    }

    @Override
    public void display() {
        System.out.println("StatisticDisplay:");
    }
}
