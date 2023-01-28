import java.util.*;
import java.math.BigInteger;

public class main {
    public static void main(String[] args) {
         Scanner sc = new Scanner(System.in);

         String[] input = sc.nextLine().split(" ");
         BigInteger bi1 = new BigInteger(input[0]);
         BigInteger bi2 = new BigInteger(input[1]);

         System.out.println(bi1.add(bi2).toString());
    }
}
