import java.util.*;

public class main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int t = 0, result = 0;
        int n = sc.nextInt();
        int[] p = new int[n];
        for(int i=0; i<n; i++) {
            p[i] = sc.nextInt();
        }
        Arrays.sort(p);

        for(int i=0; i<n; i++) {
            t += p[i];
            result += t;
        }

        System.out.println(result);
    }
}
