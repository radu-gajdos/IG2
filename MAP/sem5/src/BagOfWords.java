import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;

public class BagOfWords {
    private LinkedHashSet<String> uniqueWords = new LinkedHashSet<>();

    public BagOfWords(List<String> sentences) {
        for (String text : sentences) {
            String[] words = text.split(" ");
            for (String word : words) {
                uniqueWords.add(word);
            }
        }
    }

    public List<Double> transform(String text) {
        HashMap<String, Integer> frequency = new HashMap<String, Integer>();
        String[] words = text.split(" ");
        for (String word : words) {
            frequency.put(word, frequency.getOrDefault(word, 0) + 1);
        }

        List<Double> result = new ArrayList<Double>();
        for (String key : uniqueWords) {
            double value = frequency.getOrDefault(key,0).doubleValue();
            result.add(value);
        }
        return result;
    }
}
