import java.util.*;

public class main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        String result = "";
        
        int n = sc.nextInt();
        String[] string = new String[n];
        int[] repeat = new int[n];
        for(int i=0; i<n; i++) {
            repeat[i] = sc.nextInt();
            string[i] = sc.next();
        } 

        for(int i=0; i<n; i++) {
            result = "";
            for(int j=0; j<string[i].length(); j++) {
                for(int k=0; k<repeat[i]; k++) {
                    result += string[i].charAt(j);
                }
            }

            System.out.println(result);
        }
    }
}
