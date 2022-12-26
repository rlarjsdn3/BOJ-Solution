import java.util.*;

public class main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int count = 0, endTime = -1;
        int n = sc.nextInt();
        Meeting[] meeting = new Meeting[n];
        for(int i=0; i<n; i++) {
            meeting[i] = new Meeting(sc.nextInt(), sc.nextInt());
        }

        Arrays.sort(meeting, new Comparator<Meeting>() {
            public int compare(Meeting m1, Meeting m2) {
                return m1.compareTo(m2);
            }
        });

        for(int i=0; i<n; i++) {
            if(endTime <= meeting[i].start) {
                count += 1;
                endTime = meeting[i].end;
            }
        }
        
        System.out.println(count);
    }
}

class Meeting implements Comparable<Meeting> {
    int start;
    int end;

    Meeting(int start, int end) {
        this.start = start;
        this.end = end;
    }

    @Override
    public int compareTo(Meeting m) {
        if(this.end == m.end) {
            return this.start - m.start;
        }

        return this.end - m.end;
    }
}
