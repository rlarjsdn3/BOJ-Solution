import java.time.*;
import java.util.*;

public class main {
    static Scanner s = new Scanner(System.in);

    public static void main(String[] args) {
        int[] abc = new int[3];
        for(int i=0; i<abc.length; i++)
            abc[i] = Integer.parseInt(s.next());
        int d = s.nextInt();

        LocalTime time = LocalTime.of(abc[0], abc[1], abc[2]);
        time = time.plusSeconds(d);

        System.out.println(time.getHour() + " " 
                                    + time.getMinute() + " " + time.getSecond());
    }
}
