 import java.util.*;

public class main {
    static Scanner sc = new Scanner(System.in);

    public static void main(String[] args) {
        int hour = Integer.parseInt(sc.next());
        int minutes = Integer.parseInt(sc.next());
        int add = Integer.parseInt(sc.next());

        minutes += add;
        if(minutes >= 60) {
            hour = (hour+(minutes/60))%24;
            minutes = minutes%60;
        }

        System.out.println(hour + " " + minutes);
    }
}
