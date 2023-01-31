import java.util.*;
import java.math.BigInteger;

public class main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        // 문자의 개수 L 입력 받기
        int l = sc.nextInt();
        // L개의 문자 입력 받기
        char[] input = sc.next().toCharArray();

        // 해시값 구하기
        BigInteger result = new BigInteger("0"); // 결과를 저장하기 위한 변수
        for(int i=0; i<l; i++) {
            result = result.add(new BigInteger(Integer.toString(input[i]-97+1))
                                .multiply(new BigInteger("31").pow(i))).mod(new BigInteger("1234567891"));
        }

        System.out.println(result.toString()); // 결과값 출력하기
    }
}
