import Foundation

// 정수 N 입력 받기
var n = Int(readLine()!)!
// 정수 n이 1이 될 때까지 반복
while n != 1 {
    // n이 2...n까지 나누어 떨어지는지 확인
    for i in 2...n {
        // 나누어 떨어지는 경우
        if n % i == 0 {
            print(i) // 결과값 출력
            n /= i
            break
        }
    }
}
