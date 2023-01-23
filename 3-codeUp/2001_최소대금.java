import java.util.*;

public class main {
    static Scanner s = new Scanner(System.in);

    public static void main(String[] args) {
        int[] pasta = new int[3];
        int[] juice = new int[2];

        for(int i=0; i<pasta.length; i++)
            pasta[i] = Integer.parseInt(s.next());

        for(int i=0; i<juice.length; i++)
            juice[i] = Integer.parseInt(s.next());
        
        Arrays.sort(pasta);
        Arrays.sort(juice);

        int sum = pasta[0]+juice[0];
        double result = sum * 1.1;
        System.out.printf("%.1f", result);
    }
}
