import java.util.Arrays;

public class Main {

    public static String reverse(String input){

        StringBuilder newString = new StringBuilder();

        for (int i = input.length()-1 ; i>=0 ;i--){
            newString.append(input.charAt(i));
        }

        return newString.toString();

    }
    public static int count(String input){

        int wc=0;
        boolean inWord = false;

        StringBuilder newString = new StringBuilder();

        for (int i = 0 ; i< input.length() ;i++){
            char ch = input.charAt(i);

            if(Character.isLetter(ch)){
                if(!inWord){
                    wc++;
                    inWord=true;
                }
            }else{
                inWord=false;
            }
        }

        return wc;
    }

    public static void main(String[] args) {

        Auto dacia = new Auto(10000, "logan");

        System.out.println(count("asda"));

        System.out.println(dacia.toString());

        System.out.println(reverse("abcde"));

        int[] days = {1, 2, 3, 4, 5};
        int[] temp = {25, 24, 30, 32, 27};

        TempComp tempComp = new TempComp(days, temp);

        System.out.println(tempComp.avg());

        System.out.println(tempComp.min());

        System.out.println(Arrays.toString(tempComp.minDayTemp()));



    }
}