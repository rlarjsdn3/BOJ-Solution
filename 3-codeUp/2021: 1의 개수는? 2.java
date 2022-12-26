import java.util.*;

public class main {
    static Scanner s = new Scanner(System.in);

    public static void main(String[] args) {
        int start = s.nextInt();
        int end = s.nextInt();

        int count = 0;
        for(int i=start; i<=end; i++) {
            String number = String.valueOf(i);
            for(int j=0; j<number.length(); j++) {
                if(number.charAt(j) == '1')
                    count += 1;
            }
        }

        System.out.println(count);
    }
}
