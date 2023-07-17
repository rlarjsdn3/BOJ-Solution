import java.util.*;

public class main {
	static int n,m;
	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);

		n = sc.nextInt();
		m = sc.nextInt();
		int[] a = new int[n];
		int[] b = new int[m];
		for (int i = 0; i < n; i++) {
			a[i] = sc.nextInt();
		}
		for (int i = 0; i < m; i++) {
			b[i] = sc.nextInt();
		}

		StringBuilder sb = new StringBuilder();
		Arrays.sort(a);
		Arrays.sort(b);
		int i = 0;
		int j = 0;
		int k = 0;
		while (i<n && j<m) {
			if(a[i]<b[j]) {
				sb.append(a[i++]+" ");
			} else {
				sb.append(b[j++]+" ");
			}
		}
		while (i < n) {
			sb.append(a[i++]+" ");
		}
		while (j < m) {
			sb.append(b[j++]+" ");
		}
		
		System.out.println(sb.toString());
	}
}
