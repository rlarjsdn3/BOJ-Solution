import java.util.*;

public class main {
    public static int[] solution(int []arr) {
        int[] answer;
        ArrayList<Integer> al = new ArrayList<>();
        
        al.add(arr[0]);
        for(int i=1; i<arr.length; i++) {
            if(arr[i-1]==arr[i])
                continue;
            al.add(arr[i]);
        }

        answer = al.stream()
                        .mapToInt(Integer::intValue).toArray();
        return answer;
    }

    public static void main(String[] args) {
        System.out.println(Arrays.toString(solution(new int[]{4, 4, 4, 3, 3})));
    }
}
