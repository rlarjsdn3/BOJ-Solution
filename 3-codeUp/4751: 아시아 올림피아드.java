import java.util.*;

public class main {
    static Scanner s = new Scanner(System.in);

    public static void main(String[] args) {
        int n = s.nextInt();
        ArrayList<Student> students = new ArrayList<Student>();
        for(int i=0; i<n; i++) {
            students.add(new Student(Integer.parseInt(s.next()), 
                        Integer.parseInt(s.next()), Integer.parseInt(s.next())));
        }
        int[] countryCount = new int[1001];

        students.sort(new Comparator<Student>() {
            public int compare(Student s1, Student s2) {
                return -(s1.score - s2.score); // 점수를 기준으로 오름차순 정렬
            }
        });

        for(int c=0, i=0; c<3; i++) {
            Student student = students.get(i);
            if(++countryCount[student.country] > 2) {
                continue;
            }
            
            System.out.println(student);
            c++;
        }
    }
}

class Student{
    int country;
    int number;
    int score;

    Student(int country, int number, int score) {
        this.country = country;
        this.number = number;
        this.score = score;
    }

    public String toString() {
        return country + " " + number;
    }
}
