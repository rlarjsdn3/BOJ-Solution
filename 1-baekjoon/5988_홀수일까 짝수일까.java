import java.util.*;
import java.math.BigInteger;
import java.util.stream.Stream;

public class main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int t = sc.nextInt(); // 테스트 케이스의 수  입력 받기

        String[] result = new String[t];
        for(int i=0; i<t; i++) {
            BigInteger bi = new BigInteger(sc.next());
            // 짝수인 경우
            if(bi.remainder(new BigInteger("2")).equals(new BigInteger("0"))) {
                result[i] = "even";
            // 홀수인 경우
            } else {
                result[i] = "odd";
            }
        }
        
        // 결과값 출력하기
        Arrays.stream(result).forEach(System.out::println);
    }
}
