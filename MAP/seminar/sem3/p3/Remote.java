package p3;

import java.util.Iterator;
import java.util.NoSuchElementException;

public class Remote implements Iterator {

    int index;
    TV tv;

    public Remote(TV obj) {
        index = 0;
        tv = obj;
    }

    @Override
    public boolean hasNext() {
        return index < tv.getChannels().length;
    }

    @Override
    public Object next() {
        return null;
    }

    public boolean hasPrevious() {
        return index > 0;
    }

    public String channelUp() {
        if (hasNext()) {
            String channel = tv.getChannelAtIndex(index);
            index++;
            return channel;
        } else throw new NoSuchElementException();
    }

    public String channelDown() {
        if (hasPrevious()) {
            index = index - 1;
            return tv.getChannelAtIndex(index - 1);
        } else throw new NoSuchElementException();
    }

    @Override
    public void remove() {
        Iterator.super.remove();
    }

}
