import java.util.*;

public class main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int valueSum = 0;
        int n = sc.nextInt(), m = sc.nextInt();
        int[] data = new int[n];
        int[] prefixSum = new int[n+1];
        int[] result = new int[m];
        for(int i=0; i<n; i++) {
            data[i] = sc.nextInt();
            valueSum += data[i];
            prefixSum[i+1] = valueSum;
        }

        for(int i=0; i<m; i++) {
            int left = sc.nextInt(), right = sc.nextInt();
            result[i] = prefixSum[right] - prefixSum[left-1];
        }

        Arrays.stream(result).forEach(System.out::println);
    }
}
