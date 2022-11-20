import java.util.*;

public class main {
    public static void main(String[] args) {
        System.out.println(Arrays.toString(new Solution().solution(new int[]{1, 2, 3, 4, 5})));
    }
}

class Solution {
    public int[] solution(int[] answers) {
        ArrayList<Integer> answer = new ArrayList<>();
        int[][] mathGiver = new int[][]{ 
            {1, 2, 3, 4, 5},
            {2, 1, 2, 3, 2, 4, 2, 5}, 
            {3, 3, 1, 1, 2, 2, 4, 4, 5, 5} 
        };
        int[] score = new int[3];
        int[] rankCnt = new int[]{ 1, 1, 1 };

        for(int i=0; i<mathGiver.length; i++) {
            for(int j=0; j<answers.length; j++) {
                if(answers[j]==mathGiver[i][j%mathGiver[i].length]) {
                    score[i] += 1;
                }
            }
        }

        //System.out.println(Arrays.toString(score));

        for(int i=0; i<score.length; i++) {
            for(int j=0; j<score.length; j++) {
                if(score[i]<score[j])
                    rankCnt[i]++;
            }
        }

        //System.out.println(Arrays.toString(rankCnt));

        for(int i=0; i<score.length; i++) {
            if(rankCnt[i]==1)
                answer.add(i+1);
        }

        return answer.stream().mapToInt(Integer::intValue).toArray();
    }
}
