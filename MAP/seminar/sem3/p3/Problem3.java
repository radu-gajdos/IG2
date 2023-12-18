package p3;

public class Problem3 {
    public static void main(String[] args) {
        String[] canale = {"Nova", "Acasa", "Happy", "ProTv"};
        TV tv = new TV(canale);
        Remote remote = new Remote(tv);
        System.out.println(remote.channelUp());
        System.out.println(remote.channelUp());
        System.out.println(remote.channelDown());
        System.out.println(remote.channelUp());
        System.out.println(remote.channelUp());
        System.out.println(remote.channelDown());
        System.out.println(remote.channelDown());
    }
}
