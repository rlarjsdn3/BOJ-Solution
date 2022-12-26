import java.util.*;

public class main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        int n = sc.nextInt();
        int k = sc.nextInt();

        int i = 0;
        int count = 0;
        int[] coinType = new int[n];
        for(; i<coinType.length; i++) {
            coinType[i] = sc.nextInt();
        }

        i = coinType.length-1;
        for(; i>=0; i--) {
            if(k >= coinType[i]) {
                count += (k/coinType[i]);
                k -= coinType[i] * (k/coinType[i]);
            }
        }

        System.out.println(count);
    }
}
