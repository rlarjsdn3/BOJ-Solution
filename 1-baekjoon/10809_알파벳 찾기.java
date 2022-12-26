import java.util.*;

public class main {
    public static void main(String[] args) {
        String s = new Scanner(System.in).nextLine();

        int[] alphabet = new int[26];
        for(char c='a'; c<='z'; c++) {
            alphabet[c-97] = s.indexOf(c);
        }

        for(int i=0; i<alphabet.length; i++) {
            System.out.print(alphabet[i] + " ");
        }
    }
}
