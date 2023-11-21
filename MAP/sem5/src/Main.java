import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {

        List<String> sentences = new ArrayList<>();
        sentences.add("b b c a d");
        sentences.add("a a b d");

        BagOfWords bagOfWords = new BagOfWords(sentences);

        System.out.println(bagOfWords.transform(sentences.get(1)));

        TestBuilder.describe(“Sum of numbers”).expect(result).equal().to(expectedResult);
    }
}