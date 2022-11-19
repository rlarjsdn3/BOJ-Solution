import java.util.*;

public class main {
    static int count = 0;
    static int element = 0;
    static int[] tmp = null;

    public static void countCheck(int n, int k) {
        if(k==count) {
            element = n;
        }
    }

    public static void mergeSort(int[] arr, int p, int r, int k) {
        if(p < r) {
            int q = (p+r) / 2;
            mergeSort(arr, p, q, k);
            mergeSort(arr, q+1, r, k);
            merge(arr, p, q, r, k);
        }
    }

    public static void merge(int[] arr, int p, int q, int r, int k) {
        int i = p, j = q + 1, t = 0;

        while(i<=q && j<=r) {
            if(arr[i]<=arr[j]) {
                count += 1;
                tmp[t++] = arr[i++];
            } else {
                count += 1;
                tmp[t++] = arr[j++];
            }

            countCheck(tmp[t-1], k);
        }

        while(i<=q) {
            count += 1;
            tmp[t++] = arr[i++];

            countCheck(tmp[t-1], k);
        }
        while(j<=r) {
            count += 1;
            tmp[t++] = arr[j++];

            countCheck(tmp[t-1], k);
        }

        if(count < k) {
            element = -1;
        }

        for(i=p, t=0; i<=r; i++, t++) {
            arr[i] = tmp[t];
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int n = sc.nextInt(), k = sc.nextInt();
        tmp = new int[n];
        int[] arr = new int[n];
        for(int i=0; i<n; i++) {
            arr[i] = sc.nextInt();
        }
        
        mergeSort(arr, 0, n-1, k);
        System.out.println(element);
    }
}
