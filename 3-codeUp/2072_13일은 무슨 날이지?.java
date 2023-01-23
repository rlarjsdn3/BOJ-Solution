import java.util.*;

public class main {
    public static void main(String[] args) {
        final String[] MONTH_NAME = { "", "Sunday", "Monday", "Tuesday", "Wednesday", 
                                      "Thursday", "Oh my god!", "Saturday" };
        int dayOf13th = 0;

        Scanner s = new Scanner(System.in);

        int year = s.nextInt();
        int month = s.nextInt();

        Calendar sDay = Calendar.getInstance();
        Calendar eDay = Calendar.getInstance();
        
        sDay.set(year, month-1, 1);
        eDay.set(year, month-1, sDay.getActualMaximum(Calendar.DAY_OF_MONTH));

        System.out.println("CALENDAR " + year + " " + month);
        System.out.println("   S   M   T   W   T   F   S");

        for(int i=1; i<sDay.get(Calendar.DAY_OF_WEEK); i++) {
            System.out.print("    ");
        }

        for(int n=sDay.get(Calendar.DAY_OF_WEEK); 
                    sDay.before(eDay); sDay.add(Calendar.DAY_OF_MONTH, 1), n++) {
            int day = sDay.get(Calendar.DAY_OF_MONTH);
            System.out.print((day<10 ? "   " : "  ") + day);
            if(n%7 == 0) System.out.println();

            if(day == 13) {
                dayOf13th = sDay.get(Calendar.DAY_OF_WEEK);
            }
        }

        System.out.print("\n" + MONTH_NAME[dayOf13th]);
    }
}

