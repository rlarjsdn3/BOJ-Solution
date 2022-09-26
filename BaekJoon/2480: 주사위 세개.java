import java.util.*;

public class main {
    static Scanner sc = new Scanner(System.in);

    public static void main(String[] args) {
        int a = Integer.parseInt(sc.next());
        int b = Integer.parseInt(sc.next());
        int c = Integer.parseInt(sc.next());

        if(a==b && b==c && a==c) {
            System.out.println(10000+(a*1000));
        } else if(a==b || b==c) {
            System.out.println(1000+(b*100));
        } else if(a==c) {
            System.out.println(1000+(c*100));
        } else {
            System.out.println((a>b?(a>c?a:c):(b>c?b:c))*100);
        }
    }
}
