public class TempComp {

    int[] days;
    int[] temp;

    public TempComp(int[] days, int[] temp) {
        this.days = days;
        this.temp = temp;
    }

    public double avg(){
        int sum=0;
        int count=0;
        for (int j : temp) {
            sum += j;
            count++;
        }
        return (double) sum /count;
    }

    public int min(){
        int min=1000000;
        for (int i : temp) {
            if (i < min) {
                min = i;
            }
        }
        return min;
    }

    public int[] minDayTemp(){
        int min=1000000;
        int minIndex=-1;
        for (int i = 0; i<temp.length; i++) {
            if (temp[i] < min) {
                min = temp[i];
                minIndex=i;
            }
        }
        return new int[]{min, minIndex};
    }
}
