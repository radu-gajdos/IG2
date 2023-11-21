package p3;

import java.util.Iterator;

public class TV implements Iterable {
    private String[] channels;

    public Iterator iterator() {
        return new Remote(this);
    }

    public TV(String[] channels) {
        this.channels = channels;
    }

    public String getChannelAtIndex(int index) {
        return channels[index];
    }

    public String[] getChannels() {
        return channels;
    }

}
